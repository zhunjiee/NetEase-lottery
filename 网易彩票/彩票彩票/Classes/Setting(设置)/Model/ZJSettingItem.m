//
//  ZJSettingItem.m
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/30.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import "ZJSettingItem.h"

@implementation ZJSettingItem

+ (instancetype)itemWithIcon:(UIImage *)icon title:(NSString *)title{
    ZJSettingItem *item = [[self alloc] init];
    
    item.icon = icon;
    item.title = title;
    
    return item;
}

@end
