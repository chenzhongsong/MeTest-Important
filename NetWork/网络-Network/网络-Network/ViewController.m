//
//  ViewController.m
//  网络-Network
//
//  Created by chenzhongsong on 16/5/5.
//  Copyright © 2016年 chenzhongsong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self get];
    [self post];
}

- (void)get {
    NSURL *url = [NSURL URLWithString:@"http://ipad-bjwb.bjd.com.cn/DigitalPublication/publish/Handler/APINewsList.ashx?date=20131129&startRecord=1&len=5&udid=1234567890&terminalType=Iphone&cid=213"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:10];
    NSURLResponse *response = nil;
    NSError *error = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error) {
        NSLog(@"%@",[error localizedDescription]);
    }
    NSError *newError = nil;
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&newError];
    NSArray *array = dictionary[@"news"];
    NSDictionary *dic = array[0];
    NSLog(@"%@",dic[@"title"]);
}

- (void)post {
    NSURL *url = [NSURL URLWithString:@"http://ipad-bjwb.bjd.com.cn/DigitalPublication/publish/Handler/APINewsList.ashx?"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10];
    [request setHTTPMethod:@"POST"];
    NSData *data = [@"date=20131129&startRecord=1&len=5&udid=1234567890&terminalType=Iphone&cid=213" dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:data];
    
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    
    //同步
//    NSData *content = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
//    NSError *newError = nil;
//    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:content options:NSJSONReadingMutableContainers error:&newError];
//    NSArray *array = dictionary[@"news"];
//    NSDictionary *dic = array[0];
//    NSLog(@"%@",dic[@"title"]);
    
    //异步
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
//        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&connectionError];
//        NSArray *array = dictionary[@"news"];
//        NSDictionary *dic = array[0];
//        NSLog(@"%@",dic[@"title"]);
//    }];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            NSArray *array = dictionary[@"news"];
            NSDictionary *dic = array[0];
            NSLog(@"%@",dic[@"title"]);
            
    }];
    [dataTask resume];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end






















































