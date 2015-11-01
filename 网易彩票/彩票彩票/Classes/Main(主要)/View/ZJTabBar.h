//
//  ZJTabBar.h
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/25.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZJTabBar;
@protocol ZJTabBarDelegate <NSObject>

@optional
- (void)tabBar:(ZJTabBar *)tabBar btnDidClick:(NSInteger)index;

@end


@interface ZJTabBar : UIView


// items:UITabBarItem
@property (nonatomic, strong) NSArray *items;

@property (nonatomic, weak) id<ZJTabBarDelegate> delegate;

@end
