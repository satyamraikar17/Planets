//
//  PlanetParserDelegate.h
//  Planets
//
//  Created by iRohan on 10/01/19.
//  Copyright © 2019 satyamraikar17. All rights reserved.
//

#ifndef PlanetParserDelegate_h
#define PlanetParserDelegate_h

@protocol PlanetParserDelegate

/*!
 @brief Notifies success while Parsing of JSON data from. Provides owner with Planets NSDictionary.
 
 @param planets in NSDictionary format.
*/
- (void)didParsePlanets:(NSArray *)planets;


/*!
 @brief Notifies error while parsing JSON data.
 
 @param  error contains description and details of the error.
 */
- (void)failedParsePlanets:(NSError *)error;
@end

#endif /* PlanetParserDelegate_h */
