//
//  ZJTabBar.m
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/25.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import "ZJTabBar.h"
#import "ZJTabBarButton.h"

@interface ZJTabBar ()

@property (nonatomic, weak) UIButton *selectedBtn;

@end

@implementation ZJTabBar

- (void)setItems:(NSArray *)items{
    _items = items;
    
    for (int i = 0; i < items.count; i++) {
        // 取出对应按钮的模型
        UITabBarItem *item = items[i];
        
        // 继承自ZJTabBarButton的按钮没有高亮状态
        ZJTabBarButton *btn = [ZJTabBarButton buttonWithType:UIButtonTypeCustom];
        
        btn.tag = i;
        
        // 根据对应模型设置对应按钮的图片
        // 用setBackgroundImage可以使图片占据整个TabBar
        [btn setBackgroundImage:item.image forState:UIControlStateNormal];
        [btn setBackgroundImage:item.selectedImage forState:UIControlStateSelected];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        // 默认选中第一个按钮
        if (i == 0) {
            [self btnClick:btn];
        }
        
        [self addSubview:btn];
        
    }
    
}


// 点击TabBar上的按钮就会调用
- (void)btnClick:(UIButton *)btn{
    _selectedBtn.selected = NO;
    btn.selected = YES;
    _selectedBtn = btn;
    
    // 通知TabBarVc切换控制器
    if ([_delegate respondsToSelector:@selector(tabBar:btnDidClick:)]) {
        [_delegate tabBar:self btnDidClick:btn.tag];
    }
}

// 布局子控件位置
- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat btnW = self.bounds.size.width / _items.count;
    CGFloat btnH = self.bounds.size.height;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    for (int i = 0; i < _items.count; i++) {
        btnX = i * btnW;
        UIButton *btn = self.subviews[i];
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
    }
}

@end
