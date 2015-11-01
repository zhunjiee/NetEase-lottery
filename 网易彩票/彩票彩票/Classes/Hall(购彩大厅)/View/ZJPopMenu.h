//
//  ZJPopMenu.h
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/26.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZJPopMenu;
@protocol ZJPopMenuDelegate <NSObject>

@optional

- (void)popMenuDidClickClose:(ZJPopMenu *)popMenu;

@end

@interface ZJPopMenu : UIView

+ (instancetype)ZJPopMenu;

+ (instancetype)showPopMenuWithPoint:(CGPoint)point;

@property (nonatomic, weak) id<ZJPopMenuDelegate> delegate;

// 隐藏菜单方法
- (void)hidePopMenuInPoint:(CGPoint)point completion:(void(^)())completionBlock;

@end
