//
//  ToDoItem.h
//  ToDoList
//
//  Created by 黄人煌 on 2019/12/9.
//  Copyright © 2019 黄人煌. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ToDoItem : NSObject

//载入数据
@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSData *creationDate;

@end

NS_ASSUME_NONNULL_END
