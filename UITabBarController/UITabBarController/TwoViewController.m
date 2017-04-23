//
//  TwoViewController.m
//  UITabBarController
//
//  Created by chenzhongsong on 16/5/3.
//  Copyright © 2016年 chenzhongsong. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (id)init{
    if ([super init] != nil) {
        UITabBarItem *item = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:1];
        item.badgeValue = @"2";
        self.tabBarItem = item;
        UIView *secondView = [[UIView alloc] initWithFrame:self.view.bounds];
        secondView.backgroundColor = [UIColor greenColor];
        [self.view addSubview:secondView];
    }
    return self;
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
