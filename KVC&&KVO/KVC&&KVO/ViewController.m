//
//  ViewController.m
//  KVC&&KVO
//
//  Created by chenzhongsong on 16/4/26.
//  Copyright © 2016年 chenzhongsong. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Observer.h"

@interface ViewController ()
@property (nonatomic, strong) Person *person;
@property (nonatomic, strong) Observer *observer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *person = [[Person alloc] init];
    self.person = person;
    Book *book = [[Book alloc] init];
    // setValue:forKey: 方法设置简单属性的值，value值必须是OC对象
    [person setValue:@18 forKey:@"_age"];
    [person setValue:@1.7 forKey:@"height"];
    [person setValue:@"jack" forKey:@"name"];
    [person setValue:book forKey:@"_book"];
    // setValue:forKeyPath: 方法设置复合属性的值
    [person setValue:@25.8 forKeyPath:@"book.price"];
    
    // valueForKey: 方法获取简单属性的值
    int age = [[person valueForKey:@"age"] intValue];
    float height = person.height;
    NSString *name = [person valueForKey:@"_name"];
    // valueForKeyPath: 方法获取复合属性的值
    double bookPrice = [[person valueForKeyPath:@"_book._price"] doubleValue];
    
    
    NSLog(@"age = %d",age);
    NSLog(@"height = %f",height);
    NSLog(@"name = %@",name);
    NSLog(@"bookPrice = %f",bookPrice);
    
    // 创建一个observer对象，设置一个name属性的值
    Observer *observer = [[Observer alloc] init];
    self.observer = observer;
    observer.name = @"observer";
    
    // 为person对象注册一个监听者
    /**
     *  第1个参数：谁来监听
     *  第2个参数：监听哪一个属性
     *  第3个参数：属性发生了什么变化
     *  第4个参数：额外传入的参数
     */
    //注意 这里必须是@"height"而且要保持一致  否则setter、kvc方法可能有的不会调用
    [person addObserver:observer forKeyPath:@"height" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld  context:@"这里可以传入一些东西"];
     // 通过setter方法改变被监听的属性的值
    person.height = 1.8;
    // 通过KVC方法改变被监听的属性的值
    [person setValue:@1.9 forKey:@"height"];
    // 通过自己实现的changeValue方法改变被监听的属性的值
    [person changeValue];
    
    // 移除监听（在新版本编译器中，必须配对调用监听和移除监听的方法，否则程序会崩溃）
    /**
     *  第1个参数: 要移除哪个监听者
     *  第2个参数: 监听的是哪个属性
     */
//    [person removeObserver:observer forKeyPath:@"height"];
}

-(void)dealloc {
    // 或者在这里移除
    
    // 移除监听（在新版本编译器中，必须配对调用监听和移除监听的方法，否则程序会崩溃）
    /**
     *  第1个参数: 要移除哪个监听者
     *  第2个参数: 监听的是哪个属性
     */
    [_person removeObserver:_observer forKeyPath:@"height"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

















































@end
