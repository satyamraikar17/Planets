#import "PlanetsManager.h"

#import "PlanetsManagerDelegate.h"
#import "Parser.h"
#import "CommunicationManager.h"
#import "PlanetDataManager.h"
#import "AppDelegate.h"
#import "Parser.h"

@implementation PlanetsManager

- (void)reloadPlanets {
    [self.communicator fetchPlanets];
}

- (NSArray *)fetchPlanets {
    return [PlanetDataManager fetchPlanetsForContext:[(AppDelegate *)[[UIApplication sharedApplication] delegate] persistentContainer].viewContext];
}

#pragma mark - ParserDelegate

- (void)failedParsePlanets:(NSError *)error {
    [self.delegate fetchingPlanetsFailedWithError:error];
}

- (void)didParsePlanets:(NSArray *)planets {
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSManagedObjectContext* moc = [(AppDelegate *)[[UIApplication sharedApplication] delegate] persistentContainer].viewContext;
        
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
        dispatch_async(queue, ^{
            NSError *error = nil;
            
            NSManagedObjectContext* privateManagedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
            [privateManagedObjectContext setParentContext:moc];
            privateManagedObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy;
            
            [PlanetDataManager savePlanets:planets ForContext:privateManagedObjectContext error:error];
            
            if (error != nil) {
                [self.delegate fetchingPlanetsFailedWithError:error];
                
            } else {
                [self.delegate reloadPlanets];
            }
        });
    });
}

#pragma mark - CommunicationDelegate

- (void)receivedPlanetsJSON:(NSData *)object {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0ul);
    dispatch_async(queue, ^{
        [self.parser planets:object];
    });
}

- (void)fetchingPlanetsFailedWithError:(NSError *)error {
    [self.delegate fetchingPlanetsFailedWithError:error];
}

@end

