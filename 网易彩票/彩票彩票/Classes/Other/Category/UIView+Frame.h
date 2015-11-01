//
//  UIView+Frame.h
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/29.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

// 分类中只能增加方法,不能增加成员属性
// @property在分类中:只能生成get,set方法的声明

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@end
