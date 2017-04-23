//
//  ViewController.m
//  Block简介
//
//  Created by chenzs on 16/4/27.
//  Copyright © 2016年 chenzhongsong. All rights reserved.
//

#import "ViewController.h"
#import "Task.h"

@interface ViewController ()

@property (copy) void (^blockProperty) (void);
@property (copy, nonatomic) void (^blockPropertyWithInput) (int);

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self blockOne];
    
//    [self blockTwo];
    
//    [self blockThree];
    
    [self blockFour];
    
}

- (void)blockOne {
    int (^printBlock)(int) = ^(int inputNum) {
        NSLog(@"printBlock Called!");
        return inputNum;
    };
    
    int i = printBlock(3);
    NSLog(@"%d",i);
}

- (void)blockTwo {
    
    self.blockProperty = ^{
        NSLog(@"blockProperty is called!");
    };
    self.blockProperty();
    
    self.blockPropertyWithInput = ^(int i) {
        NSLog(@"blockPropertyWithInput is called! and the value is %d",i);
    };
    self.blockPropertyWithInput(10);
}

- (void)blockThree {
    
    //自定义无参数无返回值
    void (^blockWithOutInputAndOutput) (void) = ^(void) {
        NSLog(@"block Called!");
    };
    blockWithOutInputAndOutput();
    
    //有参数 无返回值的block
    void (^blockWithInput) (int) = ^(int inputNum) {
        NSLog(@"blockWithInput Called!");
    };
    blockWithInput(3);
    
    //有参数 有返回值的block
    int (^ab)(int) = ^(int i) {
        NSLog(@"ab");
        return i;
    };
    ab(4);
    
    //有多个参数
    double (^abc)(double, double) = ^(double a, double b) {
        NSLog(@"a*b");
        return a*b;
    };
    abc(1,2);
}

- (void)blockFour {
    Task *task = [[Task alloc] init];
    [task beginTaskWithCallbackBlock:^{
        NSLog(@"Task End!");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (void)animationWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations {
    animations();
}

@end










































