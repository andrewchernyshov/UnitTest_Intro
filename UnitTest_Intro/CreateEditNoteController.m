//
//  CreateEditNoteController.m
//  UnitTest_test
//
//  Created by Andrew Chernyhov on 13.04.16.
//  Copyright © 2016 Andrei_Chernyshou. All rights reserved.
//

#import "CreateEditNoteController.h"

@interface CreateEditNoteController ()

@end

@implementation CreateEditNoteController
- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
