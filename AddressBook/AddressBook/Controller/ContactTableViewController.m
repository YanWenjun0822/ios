//
//  ContactTableViewController.m
//  AddressBook
//
//  Created by 黄人煌 on 2019/12/6.
//  Copyright © 2019 黄人煌. All rights reserved.
//

#import "ContactTableViewController.h"
#import "JKContractModel.h"
#import "AddViewController.h"
#import "EditViewController.h"
#define ContactFilePath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) lastObject] stringByAppendingPathComponent:@"contacts.data"]

@interface ContactTableViewController ()<AddViewControllerDelegate,EditViewControllerDelegate>
- (IBAction)backAction:(id)sender;
@property (nonatomic, strong) NSMutableArray *contactArr;//创建一个数组

@end

@implementation ContactTableViewController

- (NSMutableArray *)contactArr {
    if(!_contactArr){
        _contactArr = [NSKeyedUnarchiver unarchiveObjectWithFile: ContactFilePath];
        if(_contactArr == nil){
            _contactArr = [NSMutableArray array];
        }
    }
    return _contactArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self clearExtraLine:self.tableView];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //返回分组的个数
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //cell个数 数组的个数
    return self.contactArr.count;
}

//创建cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    //传值
    JKContractModel *contactModel = self.contactArr[indexPath.row];
    //初始化模型
    cell.textLabel.text = contactModel.phone;
    cell.detailTextLabel.text = contactModel.phone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

//实现协议方法
#pragma mark - AddViewController delagate
- (void)addContact:(AddViewController *)addVc didAddContact:(JKContractModel *)contact{
    //添加数据模型并刷新表视图
    //1.添加数据模型
    [self.contactArr addObject:contact];
    //2.刷新表视图
    [self.tableView reloadData];
    //3.归档
    [NSKeyedArchiver archiveRootObject:self.contactArr toFile: ContactFilePath];
}

#pragma mark - 去掉多余的线
- (void)clearExtraLine : (UITableView *)tableView {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    [self.tableView setTableFooterView:view];
}


#pragma mark - Navigation
//设置代理对象
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //获取控制器 设置代理方法
//    AddViewController *addVc = segue.destinationViewController;
//    addVc.delegate = self;
    id vc = segue.destinationViewController;
    if([vc isKindOfClass:[AddViewController class]]) {
        //如果是跳转到添加联系人控制器
        //添加代理
        AddViewController *addVc = vc;
        addVc.delegate = self;
    }else if([vc isKindOfClass:[EditViewController class]]){
        EditViewController *editVc = vc;
        //取得选中的那一行
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        editVc.contactModel = self.contactArr[path.row];
        editVc.delagate = self;
    }
}

#pragma mark - EditVC delegate
- (void)enditViewController:(EditViewController *)editVc didSaveContact:(JKContractModel *)model{
    [self.tableView reloadData];
    //归档
    [NSKeyedArchiver archiveRootObject:self.contactArr toFile:ContactFilePath];
}

#pragma mark - UITableView delagate
- (void)tableView:(UITableView *)tableView commitEditingStyle:
       (UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:
       (NSIndexPath *)indexPath{
           if(editingStyle == UITableViewCellEditingStyleDelete){
               //1.删除数据模型
               [self.contactArr removeObjectAtIndex:indexPath.row];
               //2.刷新表视图
               [self.tableView deleteRowsAtIndexPaths:@[indexPath]
                     withRowAnimation:UITableViewRowAnimationTop];
               //3.归档
               [NSKeyedArchiver archiveRootObject:self.contactArr toFile:ContactFilePath];
       }
}
           
//注销
- (IBAction)backAction:(id)sender {
    //初始化
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"是否注销？"
                                message:@"真的要注销吗"
                                preferredStyle:UIAlertControllerStyleActionSheet];
    //添加按钮
    [alert addAction:[UIAlertAction actionWithTitle:@"取消"
                                              style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定"
                                              style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action){
                                                  [self.navigationController popViewControllerAnimated:NO];
                                              }]];
    //弹出
    [self presentViewController:alert animated:YES completion:NULL];
}


@end
