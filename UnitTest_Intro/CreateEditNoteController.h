//
//  CreateEditNoteController.h
//  UnitTest_Intro
//
//  Created by Andrei Chernyshou on 4/14/16.
//  Copyright © 2016 Epam.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SaveBlock)(NSMutableDictionary *);

@interface CreateEditNoteController : UIViewController

@property (nonatomic, strong) NSMutableDictionary *task;
@property (nonatomic, copy) SaveBlock saveTaskBlock;

@end
