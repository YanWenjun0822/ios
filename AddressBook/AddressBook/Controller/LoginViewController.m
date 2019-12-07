//
//  LoginViewController.m
//  AddressBook
//
//  Created by 黄人煌 on 2019/12/6.
//  Copyright © 2019 黄人煌. All rights reserved.
//

#import "LoginViewController.h"
#import "MBProgressHUD+NJ.h"

#define UserNameKey @"name"
#define PwdKey @"pwd"
#define RmPwdKey @"rmb_pwd"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UISwitch *rembSwitch;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
- (IBAction)loginAction;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //添加观察者 观察文本框变化
    [[NSNotificationCenter defaultCenter] addObserver:self
        selector:@selector(textChange) name:UITextFieldTextDidChangeNotification
        object:self.nameField];
    [[NSNotificationCenter defaultCenter] addObserver:self
        selector:@selector(textChange) name:UITextFieldTextDidChangeNotification
        object:self.pwdField];
    //读取上次的配置
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.nameField.text = [defaults valueForKey:UserNameKey];
    self.pwdField.text = [defaults valueForKey:PwdKey];
    self.rembSwitch.on = [defaults boolForKey:RmPwdKey];
    if(self.rembSwitch.isOn){
        self.pwdField.text = [defaults valueForKey:PwdKey];
    }
}
- (void)textChange {
    //修改按钮的点击状态
    if(self.nameField.text.length && self.pwdField.text.length) {//用户文本框与密码文本框不为空时按钮可点击
        self.loginBtn.enabled = YES;
    }else{
        self.loginBtn.enabled = NO;
    }
    //等价于
    //self.loginBtn.enabled = (self.nameField.text.length && self.pwdField.text.length);
}

#pragma mark - Navigation
//In a storyboard-based application, you will often want to do a little preparation before navigation
//跳转之前执行
/*
 一般在这里给下一个控制器传值
 这个sender是当初performSegueWithIdentifier方法传入的sender
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //Get the view Controller using [segue destinationViewController].
    //Pass the selected object to the new view controller.
    //1.取得目标控制器
    UIViewController *contactVC = segue.destinationViewController;
    //2.设置标题（传值）
    contactVC.title = [NSString stringWithFormat:@"%@的联系人列表",self.nameField.text];
}
//登陆
- (IBAction)loginAction {
    if(![self.nameField.text isEqualToString:@"wan"]) {
        [MBProgressHUD showError:@"账号不存在"];
        return;
    }
    if(![self.pwdField.text isEqualToString:@"123456"]) {
        [MBProgressHUD showError:@"密码错误"];
        return;
    }
    //显示蒙版 （遮盖）
    [MBProgressHUD showMessage:@"努力加载中"];
    //模拟2秒跳转 以后要发送网络请求
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t) (2* NSEC_PER_SEC)),dispatch_get_main_queue(), ^{
        //移除遮盖
        [MBProgressHUD hideHUD];
         //当点击按钮时实现跳转 根据标识符
        [self performSegueWithIdentifier:@"LoginToContact" sender:nil];
    });
    //存储数据
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.nameField.text forKey:UserNameKey];
    [defaults setObject:self.pwdField.text forKey:PwdKey];
    [defaults setBool:self.rembSwitch.isOn forKey:RmPwdKey];
    //设置同步
    [defaults synchronize];
   
}
@end
