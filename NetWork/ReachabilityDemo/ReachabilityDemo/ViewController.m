//
//  ViewController.m
//  ReachabilityDemo
//
//  Created by pc on 16/1/14.
//  Copyright © 2016年 Mr_辉. All rights reserved.
//

#import "ViewController.h"
#import "Reachability.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    // 直接获取网络状态
/*
    //可以使用多种方式初始化
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.hcios.com"];
    // 判断当前的网络状态
    switch ([reach currentReachabilityStatus]) {
        case ReachableViaWWAN:
            NSLog(@"正在使用移动数据网络");
            break;
        case ReachableViaWiFi:
            NSLog(@"正在使用WiFi");
            break;
        default:
            NSLog(@"无网络");
            break;
    }
*/
    
    // 通知的方式获取网络状态
    //可以使用多种方式初始化
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.hcios.com"];
    // 通知中心注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    //Reachability实例调用startNotifier方法启动网络状态监测
    [reach startNotifier];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//收到通知调用的方法
- (void)reachabilityChanged:(NSNotification *)notification {
    Reachability *reach = [notification object];
    //判断网络状态
    if (![reach isReachable]) {
        NSLog(@"网络连接不可用");
    } else {
        if ([reach currentReachabilityStatus] == ReachableViaWiFi) {
            NSLog(@"正在使用WiFi");
        } else if ([reach currentReachabilityStatus] == ReachableViaWWAN) {
            NSLog(@"正在使用移动数据");
        }
    }
}

@end
