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

@end
