#ifndef Parser_h
#define Parser_h

#import <Foundation/Foundation.h>

/*!
 @brief Used to parser JSON data and return filtered data  in dicntionary format
*/
@interface Parser : NSObject

+ (NSDictionary *)parseData:(NSData *)jsonData error:(NSError **)error;

@end


@interface PlanetParser : Parser

/*!
 @brief Converts JSON data to NSdictionary items of planetary information
 @param jsonData JSON data recieved from server
 @param error Populated by method and contains error while parsing data
 @return Array of Planets in NSDictionary format
 */
+ (NSArray *)planets:(NSData *)jsonData error:(NSError **)error;

@end

#endif /* Parser_h */
