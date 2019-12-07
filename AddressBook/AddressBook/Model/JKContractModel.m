//
//  JKContractModel.m
//  AddressBook
//
//  Created by 黄人煌 on 2019/12/6.
//  Copyright © 2019 黄人煌. All rights reserved.
//

#import "JKContractModel.h"

@implementation JKContractModel
//存储时实现编码 对象归档
/*
 在某个对象写入文件时会调用这个方法
 在这个方法中需要说清楚哪些属性需要存储
 */
- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.phone forKey:@"phone"];
}
/*
 解析对象时会调用这个方法
 需要解析哪些属性
 */
- (id)initWithCoder:(NSCoder *)decoder {
    if(self == [super init]){
        self.name = [decoder decodeObjectForKey:@"name"];
        self.phone = [decoder decodeObjectForKey:@"phone"];
    }
    return self;
}
@end
