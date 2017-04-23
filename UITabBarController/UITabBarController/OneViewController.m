//
//  OneViewController.m
//  UITabBarController
//
//  Created by chenzhongsong on 16/5/3.
//  Copyright © 2016年 chenzhongsong. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (id)init{
    if ([super init] != nil) {
        UITabBarItem *item = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:1];
        item.badgeValue = @"";
        self.tabBarItem = item;
        UIView *firstView = [[UIView alloc] initWithFrame:self.view.bounds];
        firstView.backgroundColor = [UIColor redColor];
        [self.view addSubview:firstView];
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
