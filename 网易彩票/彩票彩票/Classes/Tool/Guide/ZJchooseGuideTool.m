//
//  ZJchooseGuideTool.m
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/30.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import "ZJchooseGuideTool.h"
#import "ZJTabBarController.h"
#import "ZJNewFetureCollectionViewController.h"
#import "ZJSaveTool.h"

#define ZJcurVersionKey @"curVersion"

@implementation ZJchooseGuideTool

+ (UIViewController *)chooseRootViewController{
    
    UIViewController *rootVc = nil;
    // *****新特性界面
    NSDictionary *dict = [NSBundle mainBundle].infoDictionary;
    
    // 获取最新的版本号
    NSString *curVersion = dict[@"CFBundleShortVersionString"];
    // 获取上一次的版本号
    NSString *lastVersion = [ZJSaveTool objectForKey:ZJcurVersionKey];
    
    
    if ([curVersion isEqualToString:lastVersion]) {
        
        // 如果没有新版本那么进入主框架界面
        rootVc = [[ZJTabBarController alloc] init];

        
    }else{
        rootVc = [[ZJNewFetureCollectionViewController alloc] init];
        
        
        // 将最新的版本号保存到偏好设置中
        [ZJSaveTool setObject:curVersion forKey:ZJcurVersionKey];
        
    }
    
    return rootVc;
}

@end
