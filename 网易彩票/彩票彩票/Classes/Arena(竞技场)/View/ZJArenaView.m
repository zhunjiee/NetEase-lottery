//
//  ZJArenaView.m
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/27.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import "ZJArenaView.h"

@implementation ZJArenaView


// 画背景
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIImage *image = [UIImage imageNamed:@"NLArenaBackground"];
    [image drawInRect:rect];
}


@end
