//
//  AddViewController.m
//  MyNotes
//
//  Created by 颜文君 on 2019/12/6.
//  Copyright © 2019 颜文君. All rights reserved.
//


#import "AddViewController.h"
#import "Note.h"
#import "NoteBL.h"

@interface AddViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *txtView;

@end

@implementation AddViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.txtView becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onclickCancel:(id)sender {
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

- (IBAction)onclickSave:(id)sender {
    //业务逻辑对象BL
    NoteBL *bl = [[NoteBL alloc] init];
    Note *note = [[Note alloc] init];
    note.date = [[NSDate alloc] init];
    note.content = self.txtView.text;
    NSMutableArray *reslist = [bl createNote: note];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"reloadViewNotification" object:reslist userInfo:nil];
    [self.txtView resignFirstResponder];
    [self dismissViewControllerAnimated:TRUE completion:nil];
    
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return FALSE;
    }
    return TRUE;
}


@end
