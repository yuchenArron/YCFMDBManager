//
//  YCFMDBManager.h
//  YCFMDBManagerDemo
//
//  Created by mac on 2017/7/5.
//  Copyright © 2017年 Netposa. All rights reserved.
//

#import <Foundation/Foundation.h>

//默认

@interface YCFMDBManager : NSObject

+ (instancetype)shareInstance;

//创建数据库 表
- (void)create:(NSString*)sqlName model:(id)model;

//增
- (void)addModel:(id)model sql:(NSString*)sqlName;

//删
- (void)delModel:(id)model sql:(NSString*)sqlName;

//改
- (void)modify:(id)model key:(NSString*)key value:(id)value sql:(NSString*)sqlName;

//查
- (id)retrieve:(id)model key:(NSString*)key value:(id)value sql:(NSString*)sqlName;

//获取 全部
- (NSArray*)retrieveAll:(id)model sql:(NSString*)sqlName;

//删除 全部
- (void)delAll:(id)model sql:(NSString*)sqlName;



@end
