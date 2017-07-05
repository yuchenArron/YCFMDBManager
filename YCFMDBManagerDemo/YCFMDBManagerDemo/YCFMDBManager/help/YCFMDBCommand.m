//
//  YCFMDBCommand.m
//  YCFMDBManagerDemo
//
//  Created by mac on 2017/7/5.
//  Copyright © 2017年 Netposa. All rights reserved.
//

#import "YCFMDBCommand.h"
#import <objc/runtime.h>

@implementation YCFMDBCommand

+ (NSString *)createTable:(id)model{
    
    NSString *cmdStr = @"";
    NSString *tableName = NSStringFromClass([model class]);
    
    unsigned int count  = 0;
    objc_property_t *properties = class_copyPropertyList([model class], &count);
    
    for (int i = 0; i < count; i++) {
        const char *propertyName = property_getName(properties[i]);
        NSString *key = [NSString stringWithUTF8String:propertyName];
        id value = [model valueForKey:key];
        NSString *fmdbType = [self fmdbDataTypeWith:value];
        
        cmdStr = [cmdStr stringByAppendingString:[NSString stringWithFormat:@"%@ %@,",key,fmdbType]];
        
    }
    cmdStr = [cmdStr substringToIndex:cmdStr.length - 1];
    return [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (%@)",tableName,cmdStr];
}

//暂时只支持string类型
//返回对应的FMDB数据类型
+ (NSString *)fmdbDataTypeWith:(id)value{
    
    NSString *ocType = NSStringFromClass([value class]);
    NSLog(@"ocType:%@",ocType);
    return @"TEXT";
}


@end
