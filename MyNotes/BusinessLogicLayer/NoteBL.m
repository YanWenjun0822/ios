//
//  NoteBL.m
//  MyNotes
//
//  Created by 颜文君 on 2019/12/6.
//  Copyright © 2019 颜文君. All rights reserved.
//

#import "NoteBL.h"

@implementation NoteBL

//插入Note方法
-(NSMutableArray*) createNote:(Note*)model {
    NoteDAO *dao = [NoteDAO sharedInstance];
    [dao create:model];
    
    return [dao findAll];
}

//删除Note方法
-(NSMutableArray*) remove:(Note*)model {
    NoteDAO *dao = [NoteDAO sharedInstance];
    [dao remove:model];
    
    return [dao findAll];
}

//查询所用数据方法
-(NSMutableArray*) findAll {
    NoteDAO *dao = [NoteDAO sharedInstance];
    return [dao findAll];
}
@end
