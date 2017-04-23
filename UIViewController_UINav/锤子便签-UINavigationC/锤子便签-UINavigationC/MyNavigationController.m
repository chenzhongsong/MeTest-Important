//
//  MyNavigationController.m
//  锤子便签-UINavigationC
//
//  Created by chenzhongsong on 16/4/29.
//  Copyright © 2016年 chenzhongsong. All rights reserved.
//

#import "MyNavigationController.h"

@interface MyNavigationController ()

@end

@implementation MyNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //导航条透明 而不是隐藏
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationBar.shadowImage = [UIImage new];
    self.navigationBar.translucent = YES;
    
    self.navigationBar.barStyle = UIBarStyleBlack;
    
    
    
    self.toolbarHidden = NO;
    self.toolbar.barStyle =  UIBarStyleBlackTranslucent;
    self.toolbar.translucent = YES;
    self.toolbar.barTintColor = [UIColor yellowColor];
    self.toolbar.tintColor = [UIColor orangeColor];
    
    
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
