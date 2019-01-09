#ifndef CommunicationManager_h
#define CommunicationManager_h

#import <Foundation/Foundation.h>

// This call is used to make network calls to server and fetch data
// Owner of this class need to implement CommunicationDelegate methods to recieve callbacks
@interface CommunicationManager : NSObject

@property (weak, nonatomic) id delegate;

// fetch data from server
- (void)fetchPlanets;

@end

#endif /* CommunicationManager_h */
