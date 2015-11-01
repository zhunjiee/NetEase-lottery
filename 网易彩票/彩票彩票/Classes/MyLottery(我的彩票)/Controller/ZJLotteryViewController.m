//
//  ZJLotteryViewController.m
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/26.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import "ZJLotteryViewController.h"
#import "ZJSettingViewController.h"

@interface ZJLotteryViewController ()

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation ZJLotteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 获取按钮的背景图片
    UIImage *image = _loginBtn.currentBackgroundImage;
    // 拉伸图片
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    
    [_loginBtn setBackgroundImage:image forState:UIControlStateNormal];
    
    
    // 设置导航条按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalImageName:@"Mylottery_config"] style:UIBarButtonItemStyleDone target:self action:@selector(setting)];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"客服" forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"FBMM_Barbutton"] forState:UIControlStateNormal];
    [btn sizeToFit];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}


- (void)setting{
    // 跳转到设置界面
    
    // 创建设置界面
    ZJSettingViewController *vc = [[ZJSettingViewController alloc] init];
    
    // 跳转到设置界面
    [self.navigationController pushViewController:vc animated:YES];
}

@end
