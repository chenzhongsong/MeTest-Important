//
//  ViewController.m
//  NSUserDefaultsDemo
//
//  Created by chenzhongsong on 16/4/21.
//  Copyright © 2016年 chenzhongsong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // Library/Preferences：存放偏好设置NSUserDefaults的plist文件
    NSArray *documents = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsStr = [documents objectAtIndex:0];
    NSLog(@"%@",documentsStr);
    
    //写数据
    //获取NSUserDefaults对象
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //保存数据
    [defaults setObject:@"jack" forKey:@"name"];
    [defaults setInteger:20 forKey:@"age"];
    [defaults setBool:YES forKey:@"sex"];//YES表示男性
    //同步数据  这个方法是立即同步  也可以不写，不写不会立即同步，系统会在一个合适的时间存储
    [defaults synchronize];
    
    //读取数据
    ////获取NSUserDefaults对象
    NSUserDefaults *defaultss = [NSUserDefaults standardUserDefaults];
    //类型需要与存储时保存一致
    NSString *name = [defaultss objectForKey:@"name"];
    NSInteger age = [defaultss integerForKey:@"age"];
    BOOL sex = [defaultss boolForKey:@"sex"];
    NSLog(@"name:%@",name);
    NSLog(@"age:%ld",(long)age);
    NSLog(@"sex:%d",sex);
    
    //删除
    [defaultss removeObjectForKey:@"sex"];
    
    //NSUserDefaults操作的始终是Library/Preferences下的同一个plist文件
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
















































