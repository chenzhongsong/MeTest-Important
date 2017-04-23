//
//  Observer.m
//  KVC&&KVO
//
//  Created by chenzhongsong on 16/4/26.
//  Copyright © 2016年 chenzhongsong. All rights reserved.
//

#import "Observer.h"

@implementation Observer

// 这个方法在对象的监听属性发生改变时，会自动调用。监听者对属性发生的改变做出什么反应也体现在这里。
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    NSLog(@"......%@ 在监听.......",self.name);
    NSLog(@"keyPath: %@",keyPath);
    NSLog(@"object: %@",[object valueForKey:@"name"]);
    NSLog(@"change: %@",change);
    NSLog(@"context: %@",context);
}








































@end
