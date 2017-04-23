//
//  ViewController.m
//  UITabBarController
//
//  Created by chenzhongsong on 16/4/29.
//  Copyright © 2016年 chenzhongsong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

- (IBAction)touchBtn:(id)sender {
    
    UITabBarController *tabBarC = [[UITabBarController alloc] init];
    NSMutableArray *controllerArray = [[NSMutableArray alloc] init];
    for (int i=0; i<6; i++) {
        UIViewController *con = [[UIViewController alloc] init];
        [con loadViewIfNeeded];
        con.view.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
        con.tabBarItem.image = [UIImage imageNamed:@"btn_publish_face_b.png"];
        con.tabBarItem.title = [NSString stringWithFormat:@"%d",i+1];
        con.title = [NSString stringWithFormat:@"%d",i+1];
        [controllerArray addObject:con];
    }
    tabBarC.viewControllers = controllerArray;
//    tabBarC.customizableViewControllers = controllerArray;//？？？？？
//    tabBarC.selectedIndex = 1;
    tabBarC.selectedViewController = (UIViewController *)controllerArray[2];
    
    
//    UIViewController *con = [[UIViewController alloc] init];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:tabBarC];
    //注意navigationItem是属于根视图控制器的，不是属于导航控制器的
    tabBarC.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:(UIBarButtonItemStyleDone) target:self action:@selector(back)];
    
    [self presentViewController:nvc animated:YES completion:^{
        
    }];
}

- (void)back {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
