//
//  ViewController.m
//  UIViewController
//
//  Created by chenzhongsong on 16/4/28.
//  Copyright © 2016年 chenzhongsong. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"

@interface ViewController ()
@property (nonatomic, strong)TwoViewController *twoVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
//    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    
    
    self.navigationItem.title = @"haha";//默认白色
    self.navigationController.navigationBar.tintColor = [UIColor greenColor];//没用
    
//    self.navigationItem.prompt = @"hehe";//提示
    
//    
//    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 589, 44)];
//    titleView.backgroundColor = [UIColor yellowColor];
//    
//    self.navigationItem.titleView = titleView;
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemDone) target:self action:@selector(right)];
    self.navigationItem.rightBarButtonItem = right;
    
    NSLog(@"View:%@:",self.navigationItem);
    NSLog(@"View:%@",self.navigationController.navigationBar.items);
    
    
    
}

- (void)right {
    
    TwoViewController *tvc = [[TwoViewController alloc] init];
    [self.navigationController pushViewController:tvc animated:YES];
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"self.presentingViewController:%@",self.presentingViewController);
    NSLog(@"self.presentedViewController:%@",self.presentedViewController);
    NSLog(@"View:%@",self);
}

- (void)aboutNavigationBarAndNavigationItem {
    
    UINavigationBar *bar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 100, 320, 80)];
    [self.view addSubview:bar];
    
    UINavigationItem * item = [[UINavigationItem alloc]initWithTitle:@"title"];
    
    //    [bar pushNavigationItem:item animated:YES];
    
    //    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    //    view.backgroundColor = [UIColor brownColor];
    //    item.titleView = view;
    
    item.prompt= @"我是navigationItem的说明文字";
    
    UINavigationItem * item2 = [[UINavigationItem alloc]initWithTitle:@"title2"];
    
    item.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"title1" style:UIBarButtonItemStylePlain target:nil action:nil];
    //    item2.hidesBackButton = YES;
    //    [item2 setHidesBackButton:YES animated:YES];
    //    [bar pushNavigationItem:item2 animated:YES];
    //设置这个和上面依次push出来的是一样的
    bar.items = @[item,item2];
    
    NSLog(@"item:%@",item);
    NSLog(@"item2:%@",item2);
    NSLog(@"bar.items:%@",bar.items);
    
    UIBarButtonItem * button = [[UIBarButtonItem alloc]initWithTitle:@"按钮" style:UIBarButtonItemStyleDone target:self action:@selector(click)];
    item2.leftBarButtonItem = button;
    //不隐藏返回按钮
    item2.leftItemsSupplementBackButton=YES;
}

- (void)click {
    NSLog(@"%s",__func__);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
