//
//  PlanetDataManager.h
//  Planets
//
//  Created by iRohan on 09/01/19.
//  Copyright © 2019 satyamraikar17. All rights reserved.
//

#ifndef PlanetDataManager_h
#define PlanetDataManager_h

#import <Foundation/Foundation.h>

@class Planet;
@class NSManagedObjectContext;

// This class is used to save planet data in CoreData
// and coredata related funtions
@interface PlanetDataManager : NSObject

// Returns NSManagedObject
// Converts dictionary data to NSManagedObject
+ (Planet *) createPlanetFromDictionary:(NSDictionary*)dict inContext:(NSManagedObjectContext*)context;

// Fetch all planets saved in core data
+ (NSArray *) fetchPlanetsForContext:(NSManagedObjectContext*)context;

// Save planets array in core data
// NSManagedObject array is accepted as parameter
+ (void) savePlanets:(NSArray*)planets ForContext:(NSManagedObjectContext*)context error:(NSError*)error;

@end

#endif /* PlanetDataManager_h */
