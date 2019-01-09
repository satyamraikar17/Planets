//
//  Parser.h
//  Planets
//
//  Created by iRohan on 09/01/19.
//  Copyright © 2019 satyamraikar17. All rights reserved.
//

#ifndef Parser_h
#define Parser_h

#import <Foundation/Foundation.h>

//This class is used to parser JSON data and return filtered data  in dicntionary format
@interface Parser : NSObject

+ (NSDictionary *)parseData:(NSData *)jsonData error:(NSError **)error;

@end

// This class returns array of planets in nsdictionary format
@interface PlanetParser : Parser

+ (NSArray *)planets:(NSData *)jsonData error:(NSError **)error;

@end

#endif /* Parser_h */
