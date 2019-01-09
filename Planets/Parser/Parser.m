#import "Parser.h"

@implementation Parser

+ (NSDictionary *)parseData:(NSData *)jsonData error:(NSError *__autoreleasing *)error {
    NSError *localError = nil;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&localError];
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
    return parsedObject;
}

@end


@implementation PlanetParser

+ (NSDictionary *)planets:(NSData *)jsonData error:(NSError *__autoreleasing *)error {
    
    NSDictionary* parsedObject = [Parser parseData:jsonData error:error];
    return [parsedObject valueForKey:@"results"];
}

@end
