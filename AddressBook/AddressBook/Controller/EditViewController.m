//
//  EditViewController.m
//  AddressBook
//
//  Created by 黄人煌 on 2019/12/6.
//  Copyright © 2019 黄人煌. All rights reserved.
//

#import "EditViewController.h"
#import "JKContractModel.h"
@interface EditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
- (IBAction)saveAction:(id)sender;
- (IBAction)editAction:(UIBarButtonItem *)sender;

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameField.text = self.contactModel.name;
    self.phoneField.text = self.contactModel.phone;
    
    //添加观察者 观察文本框变化
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textChange) name:UITextFieldTextDidChangeNotification
                                               object:self.nameField];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textChange) name:UITextFieldTextDidChangeNotification
                                               object:self.phoneField];
}
- (void)textChange {
    //修改按钮的点击状态
    //等价于
    self.saveBtn.enabled = (self.nameField.text.length && self.phoneField.text.length);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//保存
- (IBAction)saveAction:(id)sender {
    //1.关闭当前页面
    [self.navigationController popViewControllerAnimated:YES];
    //2.通知代理
    if([self.delagate respondsToSelector:@selector(editViewController:didSaveContact:)]){
        //更新数据模型
        self.contactModel.name = self.nameField.text;
        self.contactModel.phone = self.phoneField.text;
        [self.delagate editViewController:self didSaveContact:self.contactModel];
    }
}
//编辑响应方法
- (IBAction)editAction:(UIBarButtonItem *)sender {
    if(self.nameField.enabled){
        self.nameField.enabled = NO;
        self.phoneField.enabled = NO;
        [self.view endEditing:YES];
        self.saveBtn.hidden = YES;
        sender.title = @"编辑";
        //还原回原来的数据
        self.nameField.text = self.contactModel.name;
        self.phoneField.text = self.contactModel.phone;
    }else{
        self.nameField.enabled = YES;
        self.phoneField.enabled = YES;
        [self.view endEditing:YES];
        self.saveBtn.hidden = NO;
        sender.title = @"取消";
 }
}
@end
