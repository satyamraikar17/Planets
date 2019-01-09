#import "PlanetDataManager.h"
#import "Planet+CoreDataProperties.h"
#define PLANET @"Planet"
#define PRIMARY @"name"

@implementation PlanetDataManager

+ (NSArray *)fetchPlanetsForContext:(NSManagedObjectContext *)context {
    NSEntityDescription *entity = [NSEntityDescription entityForName:PLANET inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    NSError *error;
    return [context executeFetchRequest:request error:&error];
}

+ (Planet *)fetchPlanet:(NSString *)name inContext:(NSManagedObjectContext *)context {
    NSEntityDescription *entity = [NSEntityDescription entityForName:PLANET inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    [request setPredicate:[NSPredicate predicateWithFormat:@"name == %@", name]];
    NSError *error;
    NSArray *planets = [context executeFetchRequest:request error:&error];
    
    Planet *p = NULL;
    if (planets.count) {
        p = planets[0];
    }
    return p;
}

+ (void)savePlanets:(NSArray*)planets ForContext:(NSManagedObjectContext*)context error:(NSError*)error {
    
    for (NSDictionary* item in planets) {
            
        Planet *savedPlanet = [PlanetDataManager fetchPlanet:item[PRIMARY] inContext:context];

        if (savedPlanet) {
             [savedPlanet populatePlanetsWithDictionary:item];
        }
        else{
            [PlanetDataManager createPlanetFromDictionary:item inContext:context];
        }
    }
    [context save:&error];
}

+ (Planet*)createPlanetFromDictionary:(NSDictionary *)dict inContext:(NSManagedObjectContext *)context {
    
    Planet* newObject =
    (Planet*)[NSEntityDescription insertNewObjectForEntityForName:PLANET
                                            inManagedObjectContext:context];
    [newObject populatePlanetsWithDictionary:dict];
    return newObject;
}

@end
