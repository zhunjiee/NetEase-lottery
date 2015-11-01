//
//  ZJSaveTool.m
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/30.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import "ZJSaveTool.h"

@implementation ZJSaveTool

// 读取
+ (id)objectForKey:(NSString *)defaultName{
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}

// 存储
+ (void)setObject:(id)value forKey:(NSString *)defaultName{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
}

@end
