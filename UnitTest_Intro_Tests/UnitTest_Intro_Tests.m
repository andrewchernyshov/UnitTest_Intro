//
//  UnitTest_Intro_Tests.m
//  UnitTest_Intro_Tests
//
//  Created by Andrei Chernyshou on 4/14/16.
//  Copyright © 2016 Epam.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
@interface UnitTest_Intro_Tests : XCTestCase

@end

@implementation UnitTest_Intro_Tests

// Check for data source array against nil.

- (void) testTasksArray {
    
    ViewController *viewController = [[ViewController alloc] init];
    XCTAssertNotNil(viewController.taskArray);
}

// Check for data source array to be of approriate class.

- (void) testTaskArrayType {
    ViewController *viewController = [[ViewController alloc] init];
    XCTAssertTrue([viewController.taskArray isKindOfClass:[NSMutableArray class]]);
}


@end
