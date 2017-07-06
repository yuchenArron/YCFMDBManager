
//
//  YCFMDBManager.m
//  YCFMDBManagerDemo
//
//  Created by mac on 2017/7/5.
//  Copyright © 2017年 Netposa. All rights reserved.
//

#import "YCFMDBManager.h"
#import <FMDB.h>
#import "YCFMDBCommand.h"

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

- (void)create:(NSString *)sqlName model:(id)model{
    
    NSString *filePath = [self pathWith:sqlName];
    self.db = [FMDatabase databaseWithPath:filePath];
    self.dbQueue = [FMDatabaseQueue databaseQueueWithPath:filePath];
    
    [self.db open];
    
    NSString *createTableCmd = [YCFMDBCommand createTable:model];
    [self.db executeUpdate:createTableCmd];
    
    [self.db close];
    
}

- (void)addModel:(id)model sql:(NSString *)sqlName{

}

- (void)delModel:(id)model sql:(NSString *)sqlName{

}

- (void)modify:(id)model key:(NSString *)key value:(id)value sql:(NSString *)sqlName{

}

- (id)retrieve:(id)model key:(NSString *)key value:(id)value sql:(NSString *)sqlName{
    return nil;
}

- (NSArray *)retrieveAll:(id)model sql:(NSString *)sqlName{
    return nil;
}

- (void)delAll:(id)model sql:(NSString *)sqlName{

}



#pragma mark - private methods

//获取路径
- (NSString*)pathWith:(NSString*)file{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    return [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.sqlite",file]];
}


@end
