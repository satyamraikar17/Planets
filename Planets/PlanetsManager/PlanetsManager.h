#ifndef PlanetsManager_h
#define PlanetsManager_h

#import <Foundation/Foundation.h>

#import "PlanetsManagerDelegate.h"
#import "CommunicationDelegate.h"

@class CommunicationManager;
@class NSManagedObjectContext;
@class PlanetParser;

/*!
 @brief Used to fetch Planets from CoreData and to update core data with latest planets from server
 @dicussion To recive callbacks owner of this class should implement PlanetsManagerDelegate
*/
@interface PlanetsManager : NSObject
@property (strong, nonatomic) CommunicationManager *communicator;
@property (strong, nonatomic) PlanetParser *parser;
@property (weak, nonatomic) id delegate;

/*!
 @brief Update core data by fetching planets from server
 @discussion Delegate methods called with result
*/
- (void)reloadPlanets;

/*!
@brief Get saved planets from core data
@discussion Delegate methods called with result
@return Array of Planet* NSManagedObjects
*/
- (NSArray*)fetchPlanets;

@end

#endif /* PlanetsManager_h */
