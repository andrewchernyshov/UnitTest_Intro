//
//  ViewController.m
//  UnitTest_test
//
//  Created by Andrew Chernyhov on 13.04.16.
//  Copyright © 2016 Andrei_Chernyshou. All rights reserved.
//

#import "ViewController.h"
#import "UserTask.h"
#import "CreateEditNoteController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *taskTableView;

@end

@implementation ViewController

- (NSMutableArray *)taskArray {
    if (!_taskArray) {
        
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"taskArray"]) {
            _taskArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"taskArray"];
        } else {
            _taskArray = [NSMutableArray new];
        }
    }
    return _taskArray;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.taskArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    UserTask *task = self.taskArray [indexPath.row];
    cell.textLabel.text = task.title;
    return cell;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addTaskButtonPressed:(id)sender {
    
    CreateEditNoteController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"EditVC"];
    [self presentViewController:vc animated:YES completion:nil];
    
}
@end
