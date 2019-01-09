
#ifndef PlanetsManager_h
#define PlanetsManager_h

#import <Foundation/Foundation.h>

#import "PlanetsManagerDelegate.h"
#import "CommunicationDelegate.h"

@class CommunicationManager;
@class NSManagedObjectContext;

// This class is used to fetch Planets from coredata
// Also to update core data with latest planets from server
// To recive callbacks owner of this class should implement PlanetsManagerDelegate
@interface PlanetsManager : NSObject
@property (strong, nonatomic) CommunicationManager *communicator;
@property (weak, nonatomic) id delegate;

// Update core data by fetching planets from server
- (void)reloadPlanets;

// Get saved planets from core data
- (NSArray*)fetchPlanets;

@end

#endif /* PlanetsManager_h */
