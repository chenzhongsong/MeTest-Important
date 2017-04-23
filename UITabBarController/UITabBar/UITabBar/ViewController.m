//
//  ViewController.m
//  UITabBar
//
//  Created by chenzhongsong on 16/5/3.
//  Copyright © 2016年 chenzhongsong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong) UITabBar *tabBar;

@property (nonatomic,strong) UITabBarItem *firstItem;
@property (nonatomic,strong) UITabBarItem *secondItem;
@property (nonatomic,strong) UITabBarItem *thirdItem;
@property (nonatomic,strong) UITabBarItem *fourthItem;
@property (nonatomic,strong) UITabBarItem *firthItem;
@property (nonatomic,strong) UITabBarItem *sixthItem;
@end

@implementation ViewController

- (UITabBar *)tabBar{
    if (!_tabBar) {
        _tabBar = [[UITabBar alloc] initWithFrame:CGRectMake(0,617, 375, 20)];
        //将tabBar加到父视图
        [self.view addSubview:self.tabBar];
    }
    return _tabBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self tabBar];
    
    //初始化三个item
    _firstItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:0];//系统图标创建标签项
    _secondItem = [[UITabBarItem alloc] initWithTitle:@"百度" image:[UIImage imageNamed:@"1.png"] tag:1];//用用户图标创建标签项
    _thirdItem = [[UITabBarItem alloc] initWithTitle:@"宏创" image:[UIImage imageNamed:@"1.png"] tag:2];
    
    _fourthItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:3];//系统图标创建标签项
    _firthItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:4];//系统图标创建标签项
    _sixthItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:5];//系统图标创建标签项
    
    //为secondItem设置徽标
    _secondItem.badgeValue = @"2";//item的徽标
    
    
    
    self.tabBar.items = @[self.firstItem,self.secondItem,self.thirdItem,self.fourthItem,self.firthItem,self.sixthItem];//设置多个标签项
    //tabBar.barStyle = UIBarStyleBlack;
    self.tabBar.backgroundColor = [UIColor redColor];//背景色
    // tabBar.backgroundImage = [UIImage imageNamed:@"1"];//背景图片
    self.tabBar.tintColor = [UIColor blackColor];//选中item的颜色
    // tabBar.barTintColor = [UIColor greenColor];//bar的颜色
    self.tabBar.translucent = YES;//是否半透明
    self.tabBar.selectedItem = _thirdItem;
    
    [self.tabBar beginCustomizingItems:@[self.fourthItem,self.firthItem,self.sixthItem]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
