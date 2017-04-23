//
//  Person.h
//  KVC&&KVO
//
//  Created by chenzhongsong on 16/4/26.
//  Copyright © 2016年 chenzhongsong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"

@interface Person : NSObject
{
    int _age;
    Book *_book;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) float height;

- (void)changeValue ;

@end
