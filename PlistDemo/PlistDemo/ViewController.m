//
//  ViewController.m
//  PlistDemo
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
    
    /*
    //这种方式创建的plist文件只能读，不能进行修改
    
    //获取plist文件地址
    NSString *path = [[NSBundle mainBundle] pathForResource:@"People" ofType:@"plist"];
    //获取plist文件的内容(最外层是dictionary时)
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    NSLog(@"dict:%@",dict);
    
    
    //获取plist文件地址
    NSString *paths = [[NSBundle mainBundle] pathForResource:@"Peoples" ofType:@"plist"];
    //获取plist文件的内容(最外层是array时)
    NSArray *arr = [NSArray arrayWithContentsOfFile:paths];
    NSLog(@"dict:%@",arr);
    */
    
    
    //我们可以通过代码在沙盒路径下创建一个plist文件，同时可以对这个plist文件进行存储和读取等操作
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSLog(@"%@",path);
    NSString *filePath = [path stringByAppendingPathComponent:@"people.plist"];
    
    NSDictionary *dict = @{@"age":@18,@"name":@"jike",@"name":@"jike"};
    NSMutableDictionary *mutDict = [NSMutableDictionary dictionaryWithDictionary:dict];
    [mutDict writeToFile:filePath atomically:YES];
    
    [mutDict setObject:@"180" forKey:@"height"];//添加新元素
    //atomically为YES时会临时创建一个文件，写入完成后再替换到people.plist中，原子性安全
    [mutDict writeToFile:filePath atomically:YES];
    
    NSDictionary *getDict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSLog(@"getDict:%@",getDict);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end











































