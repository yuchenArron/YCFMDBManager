//
//  AppDelegate+Auxiliary.m
//  YCFMDBManagerDemo
//
//  Created by mac on 2017/7/5.
//  Copyright © 2017年 Netposa. All rights reserved.
//

#import "AppDelegate+Auxiliary.h"
#import "YCFMDBManager.h"
#import "YCUserInfo.h"

@implementation AppDelegate (Auxiliary)

-(void)testFmdb{
    YCUserInfo *userinfo = [[YCUserInfo alloc]init];
    [[YCFMDBManager shareInstance] create:@"test" model:userinfo];
}

@end
