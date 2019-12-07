//
//  NoteDAO.h
//  MyNotes
//
//  Created by 颜文君 on 2019/12/6.
//  Copyright © 2019 颜文君. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Note.h"

@interface NoteDAO : NSObject

//保存数据列表
@property (nonatomic,strong) NSMutableArray* listData;

+ (NoteDAO*)sharedInstance;

//插入Note方法
-(int) create:(Note*)model;

//删除Note方法
-(int) remove:(Note*)model;

//修改Note方法
-(int) modify:(Note*)model;

//查询所有数据方法
-(NSMutableArray*) findAll;

//按照主键查询数据方法
-(Note*) findById:(Note*)model;

@end
