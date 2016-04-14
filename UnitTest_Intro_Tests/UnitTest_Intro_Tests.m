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
@property (nonatomic, strong) XCTestExpectation *didFinishExpectation;

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
}


- (void) testSaveConfirmation {
    self.saveLoadManager = [[SaveLoadManager alloc] init];
    self.saveLoadManager.isForTest = YES;
    NSMutableDictionary *task = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Some title", @"title" ,@"Some note", @"note", nil];
    [self.saveLoadManager saveTask:task];
    XCTAssertEqual([self.saveLoadManager loadTaskArray].count, 1);
}

- (void) testInclosingObjectsCheck {
    self.saveLoadManager = [[SaveLoadManager alloc] init];
    self.saveLoadManager.isForTest = YES;
    NSMutableDictionary *task = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Some title", @"title" ,@"Some note", @"note", nil];
    [self.saveLoadManager saveTask:task];
    NSMutableDictionary *loadedTask = [[self.saveLoadManager loadTaskArray] firstObject];
    XCTAssertTrue([[loadedTask objectForKey:@"title"] isEqualToString:@"Some title"]) ;
}

//Test for operation in background

- (void) testBackgroundSaveOperationCallBack {
    
    self.didFinishExpectation = [self expectationWithDescription:@"Background queue task accomplished"];
    
    __weak typeof (self) weakSelf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        weakSelf.saveLoadManager = [[SaveLoadManager alloc] init];
        weakSelf.saveLoadManager.isForTest = YES;
        NSMutableDictionary *task = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Some title", @"title" ,@"Some note", @"note", nil];
        [weakSelf.saveLoadManager saveTask:task];
        
        [weakSelf.didFinishExpectation fulfill];
    });
    
    [self waitForExpectationsWithTimeout:3 handler:nil];
    NSMutableDictionary *loadedTask = [[self.saveLoadManager loadTaskArray] firstObject];
    XCTAssertTrue([[loadedTask objectForKey:@"title"] isEqualToString:@"Some title"]) ;
}
// Performance testing


@end
