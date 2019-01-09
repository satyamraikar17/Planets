//
//  PlanetsManagerDelegate.h
//  Planets
//
//  Created by iRohan on 09/01/19.
//  Copyright © 2019 satyamraikar17. All rights reserved.
//

#ifndef PlanetsManagerDelegate_h
#define PlanetsManagerDelegate_h

@protocol PlanetsManagerDelegate

// Indicates fetching of planets from was sucuessful
- (void)reloadPlanets;

- (void)fetchingPlanetsFailedWithError:(NSError *)error;
@end

#endif /* PlanetsManagerDelegate_h */
