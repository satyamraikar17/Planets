#ifndef CommunicationDelegate_h
#define CommunicationDelegate_h

@protocol CommunicatonDelegate

/*!
 @brief Notifies success while fetching data from server. Provides owner with JSON data.
 
 @param  objectNotation contains JSON data fetched from server.
 
 */
- (void)receivedPlanetsJSON:(NSData *)objectNotation;


/*!
 @brief Notifies error while fetching data from server.
 
 @param  error contains description and details of the error.
*/
- (void)fetchingPlanetsFailedWithError:(NSError *)error;
@end

#endif /* CommunicationDelegate_h */
