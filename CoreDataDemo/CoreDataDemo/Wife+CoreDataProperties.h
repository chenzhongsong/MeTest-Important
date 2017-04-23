//
//  Wife+CoreDataProperties.h
//  CoreDataDemo
//
//  Created by chenzhongsong on 16/5/10.
//  Copyright © 2016年 chenzhongsong. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Wife.h"

NS_ASSUME_NONNULL_BEGIN

@interface Wife (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) Husband *husband;

@end

NS_ASSUME_NONNULL_END
