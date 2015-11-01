//
//  UIImage+Image.m
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/26.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)

/*用于返回不被渲染的图片*/



+ (UIImage *)imageWithOriginalImageName:(NSString *)imageName{
    // 加载图片
    UIImage *image = [UIImage imageNamed:imageName];
    // 返回不被渲染的图片
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end
