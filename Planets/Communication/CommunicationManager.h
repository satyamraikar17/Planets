#ifndef CommunicationManager_h
#define CommunicationManager_h

#import <Foundation/Foundation.h>
/*!
 @class CommunicationManager
 @brief Used to make network calls to server and fetch data
 
 @discussion Owner of this class need to implement CommunicationDelegate methods to recieve callbacks
*/

@interface CommunicationManager : NSObject

@property (weak, nonatomic) id delegate;

/*!
 @brief Used to make network calls to server and fetch Planet JSON data
 
 @discussion Owner of this class need to implement CommunicationDelegate methods to recieve callbacks and JSON data
 */
- (void)fetchPlanets;

@end

#endif /* CommunicationManager_h */
