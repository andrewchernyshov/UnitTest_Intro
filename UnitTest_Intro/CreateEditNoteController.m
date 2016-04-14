//
//  CreateEditNoteController.m
//  UnitTest_test
//
//  Created by Andrew Chernyhov on 13.04.16.
//  Copyright © 2016 Andrei_Chernyshou. All rights reserved.
//

#import "CreateEditNoteController.h"

@interface CreateEditNoteController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *noteTextField;
@property (weak, nonatomic) IBOutlet UIButton *deleteNoteButton;
@property (weak, nonatomic) IBOutlet UIButton *saveNoteButton;

@end

@implementation CreateEditNoteController
- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)deleteNoteButtonPressed:(id)sender {
    
    self.titleTextField.text = nil;
    self.noteTextField.text = nil;
    if (self.task) {
        [self.task setObject: self.titleTextField.text forKey:@"title"];
        [self.task setObject:self.noteTextField.text forKey:@"note"];
        self.saveTaskBlock(self.task);
    }
    
    [self dismissViewControllerAnimated:NO completion:nil];
    
}
- (IBAction)saveNoteButtonPressed:(id)sender {
    
    if (!self.task) {
        NSMutableDictionary *currentTask = [[NSMutableDictionary alloc] initWithObjectsAndKeys:self.titleTextField.text, @"title", self.noteTextField.text, @"note" ,nil];
        self.saveTaskBlock(currentTask);
    } else {
        [self.task setValue:self.titleTextField.text forKey:@"title"];
        [self.task setValue:self.noteTextField.text forKey:@"note"];
        self.saveTaskBlock(self.task);
    }
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)viewDidLoad {
    
    self.deleteNoteButton.enabled = NO;
    self.saveNoteButton.enabled = NO;
    
    [super viewDidLoad];

}

- (void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
   
    [[NSNotificationCenter defaultCenter] addObserver:self selector:(@selector(textFieldDidChange:)) name:UITextFieldTextDidChangeNotification object:nil];
    
    if (self.task) {
        self.titleTextField.text = [self.task objectForKey:@"title"];
        self.noteTextField.text = [self.task objectForKey:@"note"];
        self.deleteNoteButton.enabled = YES;
        
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDidChange:(UITextField *)textField {
    
    self.saveNoteButton.enabled = (self.titleTextField.text.length > 0 || self.noteTextField.text.length > 0) ? YES : NO;
    self.deleteNoteButton.enabled = (self.titleTextField.text.length > 0 || self.noteTextField.text.length > 0) ? YES : NO;
    
}

- (void) dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

@end
