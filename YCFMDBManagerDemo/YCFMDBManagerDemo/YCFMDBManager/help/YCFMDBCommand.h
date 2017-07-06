//
//  YCFMDBCommand.h
//  YCFMDBManagerDemo
//
//  Created by mac on 2017/7/5.
//  Copyright © 2017年 Netposa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YCFMDBCommand : NSObject

//创建表 命令  表名默认为类对象类型
+ (NSString*)createTable:(id)model;

//增
+ (NSString*)add:(id)model;

//删
+ (NSString*)delModel:(id)model key:(NSString*)key value:(id)value;

//改
+ (NSString*)modifyModel:(id)model key:(NSString*)key value:(id)value;

//查
+ (NSString*)retrieveModel:(id)model key:(NSString*)key value:(id)value;

//删all
+ (NSString*)delAll:(id)model;

//查all
+ (NSString*)retrieveAll:(id)model;

@end
