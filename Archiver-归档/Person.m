//
//  Person.m
//  Archiver-归档
//
//  Created by chenzs on 16/4/21.
//  Copyright © 2016年 chenzhongsong. All rights reserved.
//

#import "Person.h"

/*
 自定义的对象归档需要实现NSCoding协议，并且实现协议中的方法，继承时必须先调用父类的归档解档方法，使用时可以直接调用普通Foundation框架中对象归档解档方法
 在项目中新建一个Person类，设置三个属性，遵守NSCoding协议并实现协议中的方法：

 */

@interface Person()<NSCoding>


@end

@implementation Person

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = @"jack";
        self.gender = @"male";
        self.age = 20;
    }
    return self;
}

//实现NSCoding协议中的归档方法
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.gender forKey:@"gender"];
    [aCoder encodeInt:self.age forKey:@"age"];
}
//实现NSCoding协议中的解档方法
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.gender = [aDecoder decodeObjectForKey:@"gender"];
        self.age = [aDecoder decodeIntForKey:@"age"];
    }
    return self;
}

@end





























