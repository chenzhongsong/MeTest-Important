//
//  Person.m
//  KVC&&KVO
//
//  Created by chenzhongsong on 16/4/26.
//  Copyright © 2016年 chenzhongsong. All rights reserved.
//

#import "Person.h"

@interface Person()


@end


@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"重写的init方法。。。。。");
    }
    return self;
}

- (void)changeValue {
    
    _height += 0.1;
    NSLog(@"__自己实现的方法改变height的值");
    NSLog(@"height = %f", _height);
    
}



















@end
