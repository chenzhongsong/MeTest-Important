//
//  TwoViewController.m
//  Navagation
//
//  Created by chenzs on 16/4/28.
//  Copyright © 2016年 chenzhongsong. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftBar)];
    
    self.navigationController.navigationBar.backItem.leftBarButtonItem = leftBar;
    
    NSLog(@"self.navigationController.navigationBar.backItem:%@",self.navigationController.navigationBar.backItem);
    NSLog(@"self.navigationController.navigationBar.topItem:%@",self.navigationController.navigationBar.topItem);
}

- (void)leftBar {
    [self.navigationController popViewControllerAnimated:YES];
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
