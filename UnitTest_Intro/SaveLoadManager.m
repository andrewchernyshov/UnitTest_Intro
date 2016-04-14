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

@end

@implementation SaveLoadManager

- (NSMutableArray *)loadTaskArray {
    if (!_taskArray) {
        
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"taskArray"]) {
            _taskArray = [[[NSUserDefaults standardUserDefaults] objectForKey:@"taskArray"] mutableCopy];
        } else {
            _taskArray = [[NSMutableArray alloc] init];
        }
    }
    return _taskArray;
}



- (BOOL)saveTask:(NSMutableDictionary *) task {
    if (![task objectForKey:@"Id"]) {
        [self.taskArray addObject:task];
    } else if((![task objectForKey:@"title"] && ![task objectForKey:@"title"]) || ([[task objectForKey:@"title"] isEqualToString:@""] && [[task objectForKey:@"note"] isEqualToString:@""])){
        
        [self.taskArray removeObjectAtIndex:[[task valueForKey:@"Id"] integerValue]];
        
    } else {
        
        [self.taskArray replaceObjectAtIndex:[[task objectForKey:@"Id"] intValue] withObject:task];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:self.taskArray forKey:@"taskArray"];
    
    return YES;
}

@end
