
//
//  YCFMDBManager.m
//  YCFMDBManagerDemo
//
//  Created by mac on 2017/7/5.
//  Copyright © 2017年 Netposa. All rights reserved.
//

#import "YCFMDBManager.h"
#import <FMDB.h>

static YCFMDBManager *manager = nil;

@interface YCFMDBManager()

@property (nonatomic, strong) FMDatabase *db;
@property (nonatomic, strong) FMDatabaseQueue *dbQueue;

@end

@implementation YCFMDBManager

+ (instancetype)shareInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[YCFMDBManager alloc]init];
    });
    return manager;
}




@end
