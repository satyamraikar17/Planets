#import "CommunicationManager.h"
#import "CommunicationDelegate.h"

#define URL @"https://swapi.co/api/planets"

@implementation CommunicationManager

- (void)fetchPlanets {
    NSURL *url = [[NSURL alloc] initWithString:URL];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    
    NSURLSessionDataTask *dataTask = [urlSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            [self.delegate fetchingPlanetsFailedWithError:error];
        } else {
            [self.delegate receivedPlanetsJSON:data];
        }
    }];
    
    [dataTask resume];
}

@end
