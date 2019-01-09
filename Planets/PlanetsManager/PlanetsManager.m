#import "PlanetsManager.h"

#import "PlanetsManagerDelegate.h"
#import "Parser.h"
#import "CommunicationManager.h"
#import "PlanetDataManager.h"
#import "AppDelegate.h"

@implementation PlanetsManager

- (void)reloadPlanets {
    [self.communicator fetchPlanets];
}

- (NSArray *)fetchPlanets {
    return [PlanetDataManager fetchPlanetsForContext:[(AppDelegate *)[[UIApplication sharedApplication] delegate] persistentContainer].viewContext];
}

#pragma mark - CommunicationDelegate

- (void)receivedPlanetsJSON:(NSData *)object {
    NSError *error = nil;
    NSArray *planets = [PlanetParser planets:object error:&error];
    
    if (error != nil) {
        [self.delegate fetchingPlanetsFailedWithError:error];
        
    } else {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSError *error = nil;

            [PlanetDataManager savePlanets:planets ForContext:[(AppDelegate *)[[UIApplication sharedApplication] delegate] persistentContainer].viewContext error:error];
            
            if (error != nil) {
                [self.delegate fetchingPlanetsFailedWithError:error];
                
            } else {
                [self.delegate reloadPlanets];
            }
        });
    }
}

- (void)fetchingPlanetsFailedWithError:(NSError *)error {
    [self.delegate fetchingPlanetsFailedWithError:error];
}

@end

