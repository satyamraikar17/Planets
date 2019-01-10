#ifndef PlanetDataManager_h
#define PlanetDataManager_h

#import <Foundation/Foundation.h>

@class Planet;
@class NSManagedObjectContext;
/*!
 @brief Used to save planet data in CoreData and coredata related funtions
*/
@interface PlanetDataManager : NSObject

/*!
 @brief Converts NSDictionary object to NSManagedObject
 @param dict NSDictionary representation of a Planet
 @param context NSManagedObjectContext used to store object
 @return NSManagedObject Planet* to be store in Coredata
*/
+ (Planet *) createPlanetFromDictionary:(NSDictionary*)dict inContext:(NSManagedObjectContext*)context;

/*!
 @brief Fetch all Planets saved in core data
 @param context NSManagedObjectContext used to retrieve objects
 @return Array of NSManagedObject Planet* from Core data
*/
+ (NSArray *) fetchPlanetsForContext:(NSManagedObjectContext*)context;

/*!
 @brief Save Planets array in core data
 @param planets Array of NSManagedObject Planet*
*/
+ (void) savePlanets:(NSArray*)planets ForContext:(NSManagedObjectContext*)context error:(NSError*)error;

@end

#endif /* PlanetDataManager_h */
