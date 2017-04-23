//
//  MyTabBarController.m
//  UITabBarController
//
//  Created by chenzhongsong on 16/5/3.
//  Copyright © 2016年 chenzhongsong. All rights reserved.
//

#import "MyTabBarController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"
#import "SixViewController.h"

@interface MyTabBarController ()<UITabBarControllerDelegate>

@end

@implementation MyTabBarController

- (id)init{
    if (self = [super init]) {
        OneViewController *firstController = [[OneViewController alloc] init];
        TwoViewController *secondController = [[TwoViewController alloc] init];
        ThreeViewController *thirdController = [[ThreeViewController alloc] init];
        FourViewController *forthController = [[FourViewController alloc] init];
        FiveViewController *fifteenController = [[FiveViewController alloc] init];
        SixViewController *sixteenController = [[SixViewController alloc] init];
        //设置UIViewController的viewController属性
        self.viewControllers = @[firstController,secondController,thirdController,forthController,fifteenController,sixteenController];//有几个添加几个
        self.selectedViewController = thirdController;//设置当前选中的controller
        self.selectedIndex = 1;//通过设置index来获取当前的controller
        self.customizableViewControllers = @[fifteenController,sixteenController];
        self.delegate = self;
    }
    return self;
}

//是否允许切换
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    return YES;
}
//当选中某一个item时候调用
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"didSelect");
}
//当more中edit按钮点击时候调用
- (void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray *)viewControllers {
    NSLog(@"willBeginCustomizing");
}
//当more中edit页面开始退出时调用
- (void)tabBarController:(UITabBarController *)tabBarController willEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
    NSLog(@"willEndCustomizing");
}
//当more中edit页面退出以后调用
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed{
    NSLog(@"didEndCustomizing");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
