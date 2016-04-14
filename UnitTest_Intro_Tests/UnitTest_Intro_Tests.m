//
//  UnitTest_Intro_Tests.m
//  UnitTest_Intro_Tests
//
//  Created by Andrei Chernyshou on 4/14/16.
//  Copyright © 2016 Epam.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
#import "SaveLoadManager.h"
@interface UnitTest_Intro_Tests : XCTestCase

@property (nonatomic, strong) SaveLoadManager *saveLoadManager;

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


- (void) testSaveManagerFunctionality {
    
    SaveLoadManager *saveLoadManager = [[SaveLoadManager alloc] init];
    saveLoadManager.isForTest = YES;
    XCTAssertTrue([saveLoadManager loadTaskArray].count == 0);
    
}

- (void) testSaveFunction {
    self.saveLoadManager = [[SaveLoadManager alloc] init];
    self.saveLoadManager.isForTest = YES;
    NSMutableDictionary *task = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Some title", @"title" ,@"Some note", @"note", nil];
    [self.saveLoadManager saveTask:task];
    XCTAssertNotNil([self.saveLoadManager loadTaskArray]);
    XCTAssertTrue([self.saveLoadManager loadTaskArray].count);
    NSMutableDictionary *loadedTask = [[self.saveLoadManager loadTaskArray] firstObject];
    XCTAssertTrue([[loadedTask objectForKey:@"title"] isEqualToString:@"Some title"]) ;
}

@end
