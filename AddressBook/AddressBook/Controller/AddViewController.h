//
//  AddViewController.h
//  AddressBook
//
//  Created by 黄人煌 on 2019/12/6.
//  Copyright © 2019 黄人煌. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AddViewController,JKContractModel;
@protocol AddViewControllerDelegate <NSObject>

@optional

//将模型数据作为参数传递
- (void)addContact:(AddViewController *)addVc didAddContact:
(JKContractModel *) contact;

@end
NS_ASSUME_NONNULL_BEGIN

@interface AddViewController : UIViewController

//asign 防止循环引用
@property (nonatomic,assign) id<AddViewControllerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
