//
//  ViewController.m
//  FMDBDemo
//
//  Created by chenzhongsong on 16/4/22.
//  Copyright © 2016年 chenzhongsong. All rights reserved.
//

#import "ViewController.h"

//下面的添加头文件都可以
//#import <FMDB/FMDB.h>
#import "FMDB.h"


//使用Pods不需要导入  sqlite3

@interface ViewController ()

@end

static FMDatabaseQueue *queue;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self FMDatabase];
    [self FMDatabaseQueue];
}


- (void)FMDatabase {
    
    //获取沙盒路径
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSLog(@"%@",documentsPath);
    //设置数据库路径
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"student.sqlite"];
    //初始化
    FMDatabase *database = [FMDatabase databaseWithPath:filePath];
    if ([database open]) {
        NSLog(@"database open success");
    } else {
        NSLog(@"database open failed");
    }
    
    
    //    1.创建数据表
    //
    //    使用FMDB建立数据表的方法十分简单，先创建sql语句，然后调用executeUpdate方法执行操作：
    
    //创建数据表person(id, name, sex, telephone)  语句一个单词都不能错
    NSString *creatSq1 = [NSString stringWithFormat:@"create table if not exists person (id integer primary key, name text, sex text, telephone text)"];
    //执行更新操作（创建表）
    if (![database executeUpdate:creatSq1]) {
        NSLog(@"creat table faile !");
    } else {
        NSLog(@"creat table success !");
        
        //        2.添加数据
        //
        //        在executeUpdate方法后直接加sql语句时要注意数据类型的使用，必须使用OC的对象类型
        
        //        //插入一条记录（1，Jack，male, 12345678）
                NSString *insertSq1 = [NSString stringWithFormat:@"insert into person (id, name, sex, telephone) values (%d, '%@', '%@', '%@')", 1, @"jack", @"male", @"12345678"];
                if (![database executeUpdate:insertSq1]) {
                    NSLog(@"insert failed!");
                }
        //
        //        //在executeUpdate后面直接加sql语法时，使用?来表示OC中的对象，integer对应NSNumber，text对应NSString，blob对应NSData，数据内部转换FMDB已经完成，只要sql语法正确就没有问题
                if (![database executeUpdate:@"insert into person (id, name, sex, telephone) values (?, ?, ?, ?)", @4, @"gary", @"male", @"99996666"]) {
                    NSLog(@"insert failed!");
                }
        
        
        
        //        3.修改数据
        
        //更新（修改）一条记录，将id = 1的记录姓名修改为mike
        NSString *updateSq1 = [NSString stringWithFormat:@"update person set name = '%@' where id = 1",@"mike"];
        //执行更新操作
        if (![database executeUpdate:updateSq1]) {
            NSLog(@"update failed !");
        }
        
        ////        4.删除数据
        //        //删除一条记录，从person表中将id= 4的记录删除
        //        NSString *deleteSql = [NSString stringWithFormat:@"delete from person where id = 4"];
        //        //执行删除操作
        //        if (![database executeUpdate:deleteSql]) {
        //            NSLog(@"delete failed!");
        //        }
        
        //        5.查询数据
        //
        //        FMDB中一切不是SELECT命令的数据库操作都视为更新，使用executeUpdate方法，SELECT命令的数据库操作使用executeQuery方法。
        
        //查询数据库中的记录
        NSString *selectSq1 = [NSString stringWithFormat:@"select * from person"];
        //使用executeQuery方法来执行查询语句，使用FMResultSet *来接收查询到的数据
        FMResultSet *rs = [database executeQuery:selectSq1];
        //[rs next]相当于sqlite3_step语句，用来逐行检索数据表中记录
        while ([rs next]) {
            //使用字段位置查询
            NSLog(@"id = %d",[rs intForColumnIndex:0]);
            //使用字段名称查询[rs stringForColumn:@"name"]
            NSLog(@"name = %@",[rs stringForColumn:@"name"]);
            NSLog(@"sex = %@",[rs stringForColumnIndex:2]);
            NSLog(@"telephone = %@",[rs stringForColumnIndex:3]);
        }
        
    }
}


- (void)FMDatabaseQueue {
    
    //获取沙盒路径
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSLog(@"%@",documentsPath);
    //设置数据库路径
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"student.sqlite"];
    
    //初始化队列
    queue = [FMDatabaseQueue databaseQueueWithPath:filePath];
    
//    //创建数据表person(id, name, sex, telephone)  语句一个单词都不能错
//    NSString *creatSq1 = [NSString stringWithFormat:@"create table if not exists person (id integer primary key, name text, sex text, telephone text)"];
    
    
    //调用inDatabase方法来将需要执行的操作添加到队列queue中去
    [queue inDatabase:^(FMDatabase *db) {
        //添加需要执行的操作
        [db executeUpdate:@"insert into person (id, name, sex, telephone) values (?, ?, ?, ?)", @100, @"test1", @"male", @"11114321"];
        [db executeUpdate:@"insert into person (id, name, sex, telephone) values (?, ?, ?, ?)", @101, @"test2", @"male", @"22224321"];
        //继续添加想要执行的操作...
    }];
    
    
    //调用inTransaction方法将需要执行的操作添加到队列中去
    [queue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        //在事务中添加需要执行的操作，出现异常时及时回滚
        if (![db executeUpdate:@"insert into person (id, name, sex, telephone) values (?, ?, ?, ?)", @104, @"test3", @"male", @"11114321"]) {
            *rollback = YES;
            return ;
        }
        if (![db executeUpdate:@"insert into person (id, name, sex, telephone) values (?, ?, ?, ?)", @105, @"test4", @"male", @"11114321"]) {
            *rollback = YES;
            return ;
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

























































