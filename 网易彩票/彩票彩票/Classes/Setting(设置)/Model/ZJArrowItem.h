//
//  ZJArrowItem.h
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/31.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import "ZJSettingItem.h"

@interface ZJArrowItem : ZJSettingItem

// 保存需要跳转的控制器的类型
// 当是ZJArrowItem类型时,跳转
@property (nonatomic, assign) Class descVcClass;

@end
