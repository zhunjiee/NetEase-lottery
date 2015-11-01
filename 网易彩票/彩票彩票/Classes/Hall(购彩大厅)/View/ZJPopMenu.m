//
//  ZJPopMenu.m
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/26.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import "ZJPopMenu.h"

#define ZJKeyWindow [UIApplication sharedApplication].keyWindow

@implementation ZJPopMenu

+ (instancetype)ZJPopMenu{
    return [[NSBundle mainBundle] loadNibNamed:@"ZJPopMenu" owner:nil options:nil].lastObject;
}


+ (instancetype)showPopMenuWithPoint:(CGPoint)point{
    ZJPopMenu *popMenu = [ZJPopMenu ZJPopMenu];
    
    popMenu.center = point;
    
    [ZJKeyWindow addSubview:popMenu];
    
    return popMenu;
}

- (IBAction)closePopMenu:(UIButton *)sender {
    [_delegate respondsToSelector:@selector(popMenuDidClickClose:)];
    [_delegate popMenuDidClickClose:self];
}

// 隐藏菜单的方法
- (void)hidePopMenuInPoint:(CGPoint)point completion:(void (^)())completionBlock{
    [UIView animateWithDuration:0.5 animations:^{
        self.center = point;
        self.transform = CGAffineTransformMakeScale(0.01, 0.01);
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        
        if (completionBlock) {
            completionBlock();
        }
    }];
}

@end
