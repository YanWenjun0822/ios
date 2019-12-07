//
//  AddViewController.m
//  AddressBook
//
//  Created by 黄人煌 on 2019/12/6.
//  Copyright © 2019 黄人煌. All rights reserved.
//

#import "AddViewController.h"
#import "JKContractModel.h"
@interface AddViewController ()
- (IBAction)backAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
- (IBAction)AddAction;


@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    if(self.nameField.text.length && self.phoneField.text.length) {//用户文本框与密码文本框不为空时按钮可点击
        self.addBtn.enabled = YES;
    }else{
        self.addBtn.enabled = NO;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    //让姓名文本框成为第一响应者
    [super viewDidAppear:animated];
    [self.nameField becomeFirstResponder];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backAction:(id)sender {
}
//添加数据
- (IBAction)AddAction {
    //1.关闭当前视图控制器
    [self.navigationController popViewControllerAnimated:YES];
    //代理传值
    if([self.delegate respondsToSelector:@selector(addContact:didAddContact:)]){
        JKContractModel *contactModel = [[JKContractModel alloc] init];
        contactModel.name = self.nameField.text;
        contactModel.phone = self.phoneField.text;
        [self.delegate addContact:self didAddContact:contactModel];
    }
}
@end
