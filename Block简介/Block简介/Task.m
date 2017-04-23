//
//  Task.m
//  Block简介
//
//  Created by chenzs on 16/4/27.
//  Copyright © 2016年 chenzhongsong. All rights reserved.
//

#import "Task.h"

@implementation Task

- (void)beginTaskWithCallbackBlock:(void (^)(void))callbackBlock{
    NSLog(@"Begin Task After 3s Finish!");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        callbackBlock();
    });
}

@end






































