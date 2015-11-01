//
//  ZJArenaNavigationController.m
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/27.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import "ZJArenaNavigationController.h"

@interface ZJArenaNavigationController ()

@end

@implementation ZJArenaNavigationController

+ (void)initialize{
    
    if (self == [ZJArenaNavigationController class]) {
    
        UINavigationBar *bar = [UINavigationBar appearanceWhenContainedIn:self, nil];
        
        // 拉伸图片
        UIImage *image = [UIImage imageNamed:@"NLArenaNavBar64"];
        image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
        
        [bar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
   
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
}



@end
