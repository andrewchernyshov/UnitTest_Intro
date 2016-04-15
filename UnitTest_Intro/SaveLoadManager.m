//
//  SaveLoadManager.m
//  UnitTest_Intro
//
//  Created by Andrei Chernyshou on 4/14/16.
//  Copyright © 2016 Epam.com. All rights reserved.
//

#import "SaveLoadManager.h"

@interface SaveLoadManager()

@property (nonatomic, strong) NSMutableArray *taskArray;
@property (nonatomic, strong) NSMutableDictionary *testStorage;

@end

@implementation SaveLoadManager

- (NSUserDefaults *)_storage {
    if (!_storage) {
        _storage = [NSUserDefaults standardUserDefaults];
    }
    return _storage;
}

- (NSMutableArray *)taskArray {
    
    if (self.isForTest) {
        if (!_taskArray) {
            
            if ([self.testStorage objectForKey:@"taskArray"]) {
                _taskArray = [self.testStorage objectForKey:@"taskArray"];
            } else {
                _taskArray = [[NSMutableArray alloc] init];
            }
        }
        return _taskArray;
    } else {
        
        if (!_taskArray) {
            
            if ([self.storage objectForKey:@"taskArray"]) {
                _taskArray = [[self.storage objectForKey:@"taskArray"] mutableCopy];
            } else {
                _taskArray = [[NSMutableArray alloc] init];
            }
        }
        return _taskArray;
    }
}

- (NSMutableDictionary *)testStorage {
    if (!_testStorage) {
        _testStorage = [[NSMutableDictionary alloc] init];
    }
    return _testStorage;
}

- (NSMutableArray *)loadTaskArray {
    return self.taskArray;
}

- (BOOL)saveTask:(NSMutableDictionary *) task {
    if (![task objectForKey:@"Id"]) {
        [self.taskArray addObject:task];
    } else if((![task objectForKey:@"title"] && ![task objectForKey:@"title"]) || ([[task objectForKey:@"title"] isEqualToString:@""] && [[task objectForKey:@"note"] isEqualToString:@""])){
        
        [self.taskArray removeObjectAtIndex:[[task valueForKey:@"Id"] integerValue]];
        
    } else {
        
        [self.taskArray replaceObjectAtIndex:[[task objectForKey:@"Id"] intValue] withObject:task];
    }
    
    if (self.isForTest) {
        [self.testStorage setObject:self.taskArray forKey:@"taskArray"];
    } else {
        [self.storage setObject:self.taskArray forKey:@"taskArray"];
    }
    return YES;
}

- (void)performHeavySaveOperationForTask:(NSMutableDictionary *)task{

    for (int i = 0; i < 2000000000; i ++) {
        
        int a = 0;
        a += i;
        
    }
    
    
    [self saveTask:task];
}


@end
