//
//  ViewController.m
//  sandBox
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
    // Do any additional setup after loading the view, typically from a nib.
    
    //获取沙盒目录
    NSString *homePath = NSHomeDirectory();
    NSLog(@"%@",homePath);
    //获取Documents文件夹目录
    NSArray *documentsArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [documentsArr objectAtIndex:0];
    NSLog(@"%@",documentsPath);
    //获取Library文件夹目录
    NSArray *libraryArr = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryPath = [libraryArr objectAtIndex:0];
    NSLog(@"%@",libraryPath);
    //获取Caches文件夹目录
    NSArray *cachesArr = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesPath = [cachesArr objectAtIndex:0];
    NSLog(@"%@",cachesPath);
    
    //这个是PreferencePanes路径  不是Preferences
//    NSArray *preferenceArr = NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES);
//    NSString *preferencePath = [preferenceArr objectAtIndex:0];
//    NSLog(@"%@",preferencePath);
//    
    
    //获取tmp文件夹目录
    NSString *tmpPath = NSTemporaryDirectory();
    NSLog(@"%@",tmpPath);
    
    //Library/Preferences 用这个方法是找不到的
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end






























































