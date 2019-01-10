#import <XCTest/XCTest.h>
#import "CommunicationManager.h"

@interface CommunicationManagerTests : XCTestCase
@property (nonatomic) CommunicationManager *communicator;
@property (nonatomic) NSData *data;
@property (nonatomic) XCTestExpectation *completionExpectation;
@end

@implementation CommunicationManagerTests

- (void)setUp {
    [super setUp];
    self.communicator = [[CommunicationManager alloc] init];
    self.communicator.delegate = self;
    self.data = nil;
}

- (void)tearDown {
    [super tearDown];
    self.data = nil;
    self.communicator = nil;
}

- (void)testFetchPlanets {
    self.completionExpectation = [self expectationWithDescription:@"delegatemethod"];
    [self.communicator fetchPlanets];
    [self waitForExpectationsWithTimeout:10.0 handler:nil];
    
    XCTAssertNotNil(self.data, "Test failed! data not recieved from server.");
}

// todo test failure case

#pragma mark - CommunicationDelegate

- (void)receivedPlanetsJSON:(NSData *)object {
    self.data = object;
    [self.completionExpectation fulfill];
}

- (void)fetchingPlanetsFailedWithError:(NSError *)error {
    [self.completionExpectation fulfill];
}

@end
