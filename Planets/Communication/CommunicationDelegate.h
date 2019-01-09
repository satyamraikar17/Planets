#ifndef CommunicationDelegate_h
#define CommunicationDelegate_h

@protocol CommunicatonDelegate
- (void)receivedPlanetsJSON:(NSData *)objectNotation;
- (void)fetchingPlanetsFailedWithError:(NSError *)error;
@end

#endif /* CommunicationDelegate_h */
