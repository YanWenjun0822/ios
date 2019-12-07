//
//  NoteBL.h
//  MyNotes
//
//  Created by 颜文君 on 2019/12/6.
//  Copyright © 2019 颜文君. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"
#import "NoteDAO.h"

@interface NoteBL : NSObject


//插入Note方法
-(NSMutableArray*) createNote:(Note*)model;

//删除Note方法
-(NSMutableArray*) remove:(Note*)model;

//查询所用数据方法
-(NSMutableArray*) findAll;


@end
