//
//  UIImage+Image.h
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/26.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Image)

// 返回一个原始的不被渲染的图片
+ (UIImage *)imageWithOriginalImageName:(NSString *)imageName;

@end
