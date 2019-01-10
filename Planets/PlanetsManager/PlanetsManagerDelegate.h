#ifndef PlanetsManagerDelegate_h
#define PlanetsManagerDelegate_h

@protocol PlanetsManagerDelegate
/*!
 @brief Indicates fetching of planets from was sucuessful
*/
- (void)reloadPlanets;

/*!
 @brief Indicates failure while fetching planets
 @param error contains error information
 */
- (void)fetchingPlanetsFailedWithError:(NSError *)error;
@end

#endif /* PlanetsManagerDelegate_h */
