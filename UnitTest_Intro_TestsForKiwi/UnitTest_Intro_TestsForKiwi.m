//
//  UnitTest_Intro_TestsForKiwi.m
//  UnitTest_Intro_TestsForKiwi
//
//  Created by Andrew Chernyhov on 14.04.16.
//  Copyright © 2016 Epam.com. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface UnitTest_Intro_TestsForKiwi : XCTestCase

@end

@implementation UnitTest_Intro_TestsForKiwi

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
