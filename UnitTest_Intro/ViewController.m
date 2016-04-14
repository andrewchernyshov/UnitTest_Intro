//
//  ViewController.m
//  UnitTest_test
//
//  Created by Andrew Chernyhov on 13.04.16.
//  Copyright © 2016 Andrei_Chernyshou. All rights reserved.
//

#import "ViewController.h"
#import "CreateEditNoteController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *taskTableView;

@end

@implementation ViewController

- (NSMutableArray *)taskArray {
    if (!_taskArray) {
        
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"taskArray"]) {
            _taskArray = [[[NSUserDefaults standardUserDefaults] objectForKey:@"taskArray"] mutableCopy];
        } else {
            _taskArray = [[NSMutableArray alloc] init];
        }
    }
    return _taskArray;
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
    __weak typeof(self) weakSelf = self;

    vc.saveTaskBlock = ^(NSMutableDictionary *task){
        
        if (![task objectForKey:@"Id"]) {
            [weakSelf.taskArray addObject:task];
        } else {
            
            [weakSelf.taskArray replaceObjectAtIndex:[[task objectForKey:@"Id"] intValue] withObject:task];
        }
        [[NSUserDefaults standardUserDefaults] setObject:weakSelf.taskArray forKey:@"taskArray"];
        [weakSelf.taskTableView reloadData];
    };

}


#pragma mark - TableView Data Source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.taskArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSMutableDictionary *task = self.taskArray [indexPath.row];
    cell.textLabel.text = task [@"title"];
    return cell;
}

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.taskArray [indexPath.row]) {
    
        CreateEditNoteController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"EditVC"];
        [self presentViewController:vc animated:YES completion:nil];
        
        [self.taskTableView deselectRowAtIndexPath:indexPath animated:NO];
        
        NSMutableDictionary *currentTask = [self.taskArray[indexPath.row] mutableCopy];
        [currentTask setObject:[NSNumber numberWithLong:indexPath.row] forKey:@"Id"];
        vc.task = currentTask;
        
         __weak typeof(self) weakSelf = self;
        vc.saveTaskBlock = ^(NSMutableDictionary *task){
            
            if (![task objectForKey:@"Id"]) {
                [weakSelf.taskArray addObject:task];
            } else if((![task objectForKey:@"title"] && ![task objectForKey:@"title"]) || ([[task objectForKey:@"title"] isEqualToString:@""] && [[task objectForKey:@"note"] isEqualToString:@""])){
                
                [weakSelf.taskArray removeObjectAtIndex:[[task valueForKey:@"Id"] integerValue]];
                
            } else {
                
                [weakSelf.taskArray replaceObjectAtIndex:[[task objectForKey:@"Id"] intValue] withObject:task];
            }
            [[NSUserDefaults standardUserDefaults] setObject:weakSelf.taskArray forKey:@"taskArray"];
            [weakSelf.taskTableView reloadData];
        };
    }
}

@end
