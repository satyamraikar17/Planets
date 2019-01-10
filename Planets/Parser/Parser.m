#import "Parser.h"
#import "PlanetParserDelegate.h"

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

- (void)planets:(NSData *)jsonData{
    
    NSError* error = nil;
    NSDictionary* parsedObject = [Parser parseData:jsonData error:&error];
    if (!error) {
        [self.delegate didParsePlanets:[parsedObject valueForKey:@"results"]];
    }
    else{
        [self.delegate failedParsePlanets:error];
    }
}

@end
