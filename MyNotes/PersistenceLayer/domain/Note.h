//
//  Note.h
//  MyNotes
//
//  Created by 颜文君 on 2019/12/6.
//  Copyright © 2019 颜文君. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface Note : NSObject

@property(nonatomic, strong) NSDate* date;
@property(nonatomic, strong) NSString* content;

-(instancetype)initWithDate:(NSDate*)date content:(NSString*)content;

-(instancetype)init;

@end
