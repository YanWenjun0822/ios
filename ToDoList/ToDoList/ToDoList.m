//
//  ToDoList.m
//  ToDoList
//
//  Created by 黄人煌 on 2019/12/9.
//  Copyright © 2019 黄人煌. All rights reserved.
//

#import "ToDoList.h"
#import "ToDoItem.h"
#import "AddToDoItem.h"

@interface ToDoList ()

@property NSMutableArray *toDoItems;

@end

@implementation ToDoList

- (void)viewDidLoad {
    [super viewDidLoad];
    self.toDoItems = [[NSMutableArray alloc] init];//初始化数组
    [self loadInitialData];
}

- (void)loadInitialData {
    ToDoItem *item1 = [[ToDoItem alloc] init];
    item1.itemName = @"Buy milk";
    [self.toDoItems addObject:item1];

    ToDoItem *item2 = [[ToDoItem alloc] init];
    item2.itemName = @"Buy milk";
    [self.toDoItems addObject:item2];

    ToDoItem *item3 = [[ToDoItem alloc] init];
    item3.itemName = @"Buy milk";
    [self.toDoItems addObject:item3];


}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //创建一个变量保存单元格的标识符
    //向表格视图请求具有该标识符的单元格 添加注释配置该单元格的代码写在哪里 并且返回单元格
    static NSString *CellIdentifier = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    ToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    if(toDoItem.completed){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //return the number of section
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return the number of rows in the section
    return [self.toDoItems count];
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue{
    AddToDoItem *source = [segue sourceViewController];
    ToDoItem *item = source.toDoItem;
    if(item != nil){
        [self.toDoItems addObject:item];
        [self.tableView reloadData];
    }
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    tappedItem.completed = !tappedItem.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}
@end
