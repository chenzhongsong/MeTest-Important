//
//  ViewController.m
//  Navagation
//
//  Created by chenzs on 16/4/28.
//  Copyright © 2016年 chenzhongsong. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    self.navigationController.navigationBar.translucent = YES;
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1000, 44)];
    titleView.backgroundColor = [UIColor redColor];
    self.navigationItem.titleView = titleView;
    
    
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
//    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    
    
    
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftBar)];
    
//    self.navigationItem.leftBarButtonItem = leftBar;
    [self.navigationItem setLeftBarButtonItem:leftBar animated:YES];
    NSLog(@"leftBar:%@",leftBar);
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 64, 44);
    [rightBtn setTitle:@"右按钮" forState:UIControlStateNormal];
    rightBtn.backgroundColor = [UIColor yellowColor];
    UIBarButtonItem *rightBar1 = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    rightBar1.width = 64;
    
    self.title = @"hhh";
    
    UIBarButtonItem *rightBar2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(rightBar2)];
    self.navigationItem.rightBarButtonItems = @[rightBar1,rightBar2];
    
    NSLog(@"self.navigationController.navigationBar.backItem:%@",self.navigationController.navigationBar.backItem);
    NSLog(@"self.navigationController.navigationBar.topItem:%@",self.navigationController.navigationBar.topItem);
    
    self.navigationController.toolbarHidden = NO;
    self.navigationController.toolbar.barTintColor = [UIColor redColor];
    
    
    
}

- (void)leftBar {
    TwoViewController *tvc = [[TwoViewController alloc] init];
    [self.navigationController pushViewController:tvc animated:YES];
}

- (void)rightBar2 {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
