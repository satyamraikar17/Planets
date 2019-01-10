#ifndef Parser_h
#define Parser_h

#import <Foundation/Foundation.h>

/*!
 @class Parser
 @brief Used to parser JSON data and return filtered data  in dicntionary format
*/
@interface Parser : NSObject

+ (NSDictionary *)parseData:(NSData *)jsonData error:(NSError **)error;

@end


@interface PlanetParser : Parser

@property (weak, nonatomic) id delegate;

/*!
 @brief Converts JSON data to NSdictionary items of planetary information
 @discussion Owner of this classs should implement PlanetParserDelegate for callbacks
 @param jsonData JSON data recieved from server
*/
- (void)planets:(NSData *)jsonData;

@end

#endif /* Parser_h */
