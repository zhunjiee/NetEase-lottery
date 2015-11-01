//
//  ZJCover.m
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/26.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import "ZJCover.h"

#define ZJKeyWindow [UIApplication sharedApplication].keyWindow


@implementation ZJCover

+ (void)show{
    // 创建窗口,和屏幕一样大
    ZJCover *cover = [[ZJCover alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.3;
    
    // 显示在主窗口上
    [ZJKeyWindow addSubview:cover];
    
}


+ (void)hide{
    // 遍历主窗口的子控件
    for (UIView *cover in ZJKeyWindow.subviews) {
        if ([cover isKindOfClass:self]) {
            [cover removeFromSuperview];
        }
    }
}



@end
