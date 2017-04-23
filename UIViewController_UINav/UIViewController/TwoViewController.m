//
//  TwoViewController.m
//  UIViewController
//
//  Created by chenzhongsong on 16/4/28.
//  Copyright © 2016年 chenzhongsong. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
//    NSLog(@"self.childViewControllers.count:%lu",(unsigned long)self.parentViewController.childViewControllers.count);
//    NSLog(@"%@",self.parentViewController);
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:(UIBarButtonSystemItemDone) target:self action:@selector(right)];
    self.navigationItem.rightBarButtonItem = right;
    
    //这也可以反映出 导航条是属于导航控制器的  而导航条上的视图是属于当前视图控制器的
    NSLog(@"TwoView:%@:",self.navigationItem);
    NSLog(@"TwoView:%@",self.navigationController.navigationBar.items);
   
}
- (void)right {
    
}
- (void)viewWillAppear:(BOOL)animated {
    
    NSLog(@"self.presentingViewController:%@",self.presentingViewController);
    NSLog(@"self.presentedViewController:%@",self.presentedViewController);
    NSLog(@"TwoVC:%@",self);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
