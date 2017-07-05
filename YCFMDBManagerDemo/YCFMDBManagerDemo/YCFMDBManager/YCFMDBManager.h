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

//删

//改

//查

//获取 全部

//删除 全部



@end
