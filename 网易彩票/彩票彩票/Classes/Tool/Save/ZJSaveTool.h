//
//  ZJSaveTool.h
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/30.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJSaveTool : NSObject

// 读取
+ (id)objectForKey:(NSString *)defaultName;

// 存储
+ (void)setObject:(id)value forKey:(NSString *)defaultName;

@end
