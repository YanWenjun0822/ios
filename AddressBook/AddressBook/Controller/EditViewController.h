//
//  EditViewController.h
//  AddressBook
//
//  Created by 黄人煌 on 2019/12/6.
//  Copyright © 2019 黄人煌. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JKContractModel,EditViewController;
@protocol EditViewControllerDelegate <NSObject>

@optional
- (void)editViewController:(EditViewController *)editVc didSaveContact :
 (JKContractModel *)model;

@end
NS_ASSUME_NONNULL_BEGIN

@interface EditViewController : UIViewController
@property (assign, nonatomic) id<EditViewControllerDelegate> delagate;
@property (strong, nonatomic) JKContractModel *contactModel;
@end

NS_ASSUME_NONNULL_END
