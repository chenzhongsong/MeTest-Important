//
//  ViewController.m
//  Archiver-归档
//
//  Created by chenzs on 16/4/21.
//  Copyright © 2016年 chenzhongsong. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self oneObjectArchiver];
    
//    [self moreObjectArchiver];
    
    [self defineClassArchiver];
}

- (void)oneObjectArchiver {
    
    //1.Foundation框架中单个对象的归档解档
    //一次只能归档一个对象，如果是多个对象归档需要分开进行，归档和解档其中任意对象都需要归档和解档整个文件
    
    
    //获取沙盒路径
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSLog(@"%@",documentsPath);
    //获取文件路径，由于归档后文件会加密，所以文件后缀可以任意取
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"file.archiver"];
    //创建一个字典，用来归档
    NSDictionary *archiverDic = @{@"name":@"jack"};
    //调用NSKeyedArchiver的类方法archiveRootObject:toFile将对象归档（返回一个bool值）
    if([NSKeyedArchiver archiveRootObject:archiverDic toFile:filePath]) {
        NSLog(@"archiver success");
    }
    //调用NSKeyedUnarchiver的类方法unarchiveObjectWithFile:将文件解档
    NSDictionary *unarchiverDic = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"%@",unarchiverDic);
    
//    NSMutableDictionary *mutArchiverDict = [NSMutableDictionary dictionaryWithDictionary:archiverDic];
//    [mutArchiverDict setObject:@"178cm" forKey:@"height"];
//    [mutArchiverDict setObject:@"178cm" forKey:@"heights"];
//    //调用NSKeyedArchiver的类方法archiveRootObject:toFile将对象归档（返回一个bool值）
//    if([NSKeyedArchiver archiveRootObject:mutArchiverDict toFile:filePath]) {
//        NSLog(@"archiver success");
//    }
//    //调用NSKeyedUnarchiver的类方法unarchiveObjectWithFile:将文件解档
//    NSDictionary *unarchiverMutDic = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
//    NSLog(@"%@",unarchiverMutDic);
    

    
}


- (void)moreObjectArchiver {
    //2.多个对象同时归档与解档
    //多个对象可以同时归档，每个对象通过键值区分，解档时键值必须与归档时键值保持匹配归档和解档其中任意对象都需要归档和解档整个文件
    
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    //这时还没有创建这个文件夹，用到的时候才会创建
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"file.archiver1"];
    NSLog(@"%@",filePath);
    
    //创建一个NSMutableData对象 用于存放需要归档的数据
    NSMutableData *archiverData = [NSMutableData data];
    //创建一个NSKeyedArchiver类的对象，用来对归档对象进行编码，编码完成才能进行归档
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:archiverData];
    [archiver encodeObject:@"lucy" forKey:@"name"];
    [archiver encodeInt:20 forKey:@"age"];
    [archiver encodeFloat:72.899 forKey:@"weight"];
    //完成编码
    [archiver finishEncoding];
    //将archiverData对象写入文件，完成归档,这时才有就不创建，没有就创建
    if ([archiverData writeToFile:filePath atomically:YES]) {
        NSLog(@"archiver success");
    }
    
    //创建NSData对象来接收解档文件
    NSData *unarchiverData = [NSData dataWithContentsOfFile:filePath];
    //创建一个NSKeyedUnarchiver对象，用来对需要解档的对象进行解码，解码后就能还原对象的数据类型
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:unarchiverData];
    NSString *name = [unarchiver decodeObjectForKey:@"name"];
    int age = [unarchiver decodeIntForKey:@"age"];
    float weight = [unarchiver decodeFloatForKey:@"weight"];
    NSLog(@"name = %@, age = %d, weight = %.2f",name, age, weight);
}

- (void)defineClassArchiver {
    //3.自定义对象的归档
    
    //对Person类创建出来的对象进行归档，归档方法同上文第一种方法一样
    //获取沙盒路径
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    //获取文件路径，由于归档后文件会加密，所以文件后缀可以任意取
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"file.archiver2"];
    //自定义对象
    Person *person = [[Person alloc] init];
    NSLog(@"person:%@",person);
    //归档
    if ([NSKeyedArchiver archiveRootObject:person toFile:filePath]) {
        NSLog(@"archiver success");
    }
    //解档
    Person *person2 = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"person2:%@",person2);
    NSLog(@"name = %@, gender = %@, age = %d", person2.name, person2.gender, person2.age);
    
    person2.gender = @"woman";
    if ([NSKeyedArchiver archiveRootObject:person2 toFile:filePath]) {
        NSLog(@"archiver success");
    }
    //解档
    Person *person3 = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    NSLog(@"person3:%@",person3);
    NSLog(@"name = %@, gender = %@, age = %d", person3.name, person3.gender, person3.age);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end













































