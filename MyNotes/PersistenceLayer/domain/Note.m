//
//  Note.m
//  MyNotes
//
//  Created by 颜文君 on 2019/12/6.
//  Copyright © 2019 颜文君. All rights reserved.
//

#import "Note.h"

@implementation Note

-(instancetype)initWithDate:(NSDate*)date content:(NSString*)content {
    
    self = [super init];
    
    if (self) {
        self.date = date;
        self.content = content;
    }
    
    return self;
}

-(instancetype)init {
    
    self = [super init];
    
    if (self) {
        self.date = [[NSDate alloc] init];
        self.content = @"";
    }
    
    return self;
}

@end
