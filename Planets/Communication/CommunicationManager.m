#import "CommunicationManager.h"
#import "CommunicationDelegate.h"

#define URL @"https://swapi.co/api/planets"

@implementation CommunicationManager

- (void)fetchPlanets:(NSString*)url_string {
    NSURL *url = [[NSURL alloc] initWithString:url_string];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    
    NSURLSessionDataTask *dataTask = [urlSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            [self.delegate fetchingPlanetsFailedWithError:error];
        } else {
            
            [self.delegate receivedPlanetsJSON:data];
            
            // to do retrieve next page
        }
    }];
    
    [dataTask resume];
}

- (void)fetchPlanets {
    [self fetchPlanets:URL];
}

@end
