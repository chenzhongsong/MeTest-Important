//
//  FirstViewController.m
//  锤子便签-UINavigationC
//
//  Created by chenzhongsong on 16/4/29.
//  Copyright © 2016年 chenzhongsong. All rights reserved.
//

#import "FirstViewController.h"
#import "Global.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //根据设备计算偏移量
    CGFloat offsetY;
    if (IS_IPHONE_6AND6S) {
        offsetY = -8;
    }else if(IS_IPHONE_6PAND6SP) {
        offsetY = -15;
    }else {
        offsetY = 0;
    }
    
    //TitleView
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 33)];
    titleLabel.text = @"锤子便签";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    //必须把它放在一个view上，才能偏移,  下同
    UIView *centerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 33)];
    [centerView addSubview:titleLabel];
    titleLabel.backgroundColor = [UIColor redColor];
    centerView.bounds = CGRectOffset(centerView.bounds, 0, offsetY);
    self.navigationItem.titleView = centerView;
    
    //左侧按钮
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 44, 44);
    leftBtn.backgroundColor = [UIColor redColor];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"btn_bg_n"] forState:UIControlStateNormal];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"btn_bg_p"] forState:UIControlStateHighlighted];
    [leftBtn setImage:[UIImage imageNamed:@"btn_about"] forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"btn_about"] forState:UIControlStateHighlighted];
    [leftBtn addTarget:self action:@selector(clickLeftBarButton) forControlEvents:UIControlEventTouchUpInside];
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [leftView addSubview:leftBtn];
    //调整位置
    leftView.bounds = CGRectOffset(leftView.bounds, 10, offsetY);
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftView];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    
    //右侧按钮
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"btn_bg_n"] forState:UIControlStateNormal];
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"btn_bg_p"] forState:UIControlStateHighlighted];
    [rightBtn setImage:[UIImage imageNamed:@"btn_new"] forState:UIControlStateNormal];
    [rightBtn setImage:[UIImage imageNamed:@"btn_new"] forState:UIControlStateHighlighted];
    [rightBtn addTarget:self action:@selector(clickRightBarButton) forControlEvents:UIControlEventTouchUpInside];
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [rightView addSubview:rightBtn];
    //调整位置
    rightView.bounds = CGRectOffset(rightView.bounds, -10, offsetY);
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightView];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    NSLog(@"%@",self.navigationItem);
    NSLog(@"%@",self.navigationController.navigationBar.items);
    
    [self creatToolbarItems];
}

- (void)clickLeftBarButton {
    NSLog(@"%s",__func__);
}

- (void)clickRightBarButton {
    NSLog(@"%s",__func__);
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    SecondViewController *second = [storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
//    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:second animated:YES];
    
}

- (void)creatToolbarItems {
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:nil];
    NSLog(@"%@",item1);
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:nil];
    NSLog(@"%@",item2);
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:nil];
    NSLog(@"%@",item3);
    self.toolbarItems = @[item1,item2,item3];
    
    NSLog(@"self.navigationController.toolbar.items:%@",self.navigationController.toolbar.items);
}

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    self.navigationController.toolbarHidden = NO;
//}

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
