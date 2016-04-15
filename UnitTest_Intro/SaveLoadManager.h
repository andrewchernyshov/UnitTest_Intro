//
//  SaveLoadManager.h
//  UnitTest_Intro
//
//  Created by Andrei Chernyshou on 4/14/16.
//  Copyright © 2016 Epam.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SaveLoadManager : NSObject

@property (nonatomic, assign) BOOL isForTest;
@property (nonatomic, strong) NSUserDefaults *storage;

- (NSMutableArray *)loadTaskArray;
- (BOOL)saveTask:(NSMutableDictionary *) task;
- (void)performHeavySaveOperationForTask:(NSMutableDictionary *)task;

@end
