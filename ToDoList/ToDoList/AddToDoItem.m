//
//  AddToDoItem.m
//  ToDoList
//
//  Created by 黄人煌 on 2019/12/9.
//  Copyright © 2019 黄人煌. All rights reserved.
//

#import "AddToDoItem.h"

@interface AddToDoItem ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;

@end

@implementation AddToDoItem

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if(sender != self.doneButton)
        return;
    if(self.textField.text.length>0){
        self.toDoItem = [[ToDoItem alloc]init];
        self.toDoItem.itemName = self.textField.text;
        self.toDoItem.completed = NO;
    }
}
@end
