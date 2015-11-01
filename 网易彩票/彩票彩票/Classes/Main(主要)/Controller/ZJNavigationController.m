//
//  ZJNavigationController.m
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/25.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import "ZJNavigationController.h"
#import "UIImage+Image.h"

@interface ZJNavigationController () <UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) id popDelegate;

@end

@implementation ZJNavigationController


// 用initialize可以实现只设置一次导航控制器的导航栏图片
// 作用:初始化类, 第一次调用当前类或者子类的时候调用
+ (void)initialize{
    // 当前类初始化的时候才调用
    if (self == [ZJNavigationController class]) {
        
//        // 获取当前应用下所有的导航条
//        UINavigationBar *nav = [UINavigationBar appearance];
        
        // 获取当前类下面的导航条
        UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
        // 设置背景图片
        // 一定要用UIBarMetricsDefault,才能设置导航条的背景图片
        // UIBarMetricsDefault导致导航控制器的子控制器的view尺寸改变
        [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
        
        // 设置导航条标题的相关属性
        NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
        dictM[NSForegroundColorAttributeName] = [UIColor whiteColor];
        dictM[NSFontAttributeName] = [UIFont systemFontOfSize:20];
        
        [navBar setTitleTextAttributes:dictM];
        

        
//        // 设置返回按钮的文字颜色
//        
//        // 设置主题颜色
//        navBar.tintColor = [UIColor whiteColor];
//        
//        // 导航条上按钮的内容是由UIBarButtonItem决定
//        // 获取当前类里面所有的UIBarButtonItem
//        UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedIn:self, nil];
//        // 设置返回按钮文字的位置很远,看不见
//        [item setBackButtonTitlePositionAdjustment:UIOffsetMake(-1000, 0) forBarMetrics:UIBarMetricsDefault];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
//    self.interactivePopGestureRecognizer.delegate = nil;
    
    // 恢复滑动返回功能
    _popDelegate = self.interactivePopGestureRecognizer.delegate;
    // 设置代理,目的监听子控制器有没有完全显示
    self.delegate = self;
    
    
    // NSLog(@"%@", self.interactivePopGestureRecognizer.delegate);
    //    id gesture = self.interactivePopGestureRecognizer;

    
    // 1.系统的手势类型:UIScreenEdgePanGestureRecognizer,才不能全屏滑动
    // 2.target:_UINavigationInteractiveTransition
    // 3.action:(滑动返回功能)handleNavigationTransition:
    
    
    // 禁用系统自带手势
    self.interactivePopGestureRecognizer.enabled = NO;
    // 自己创建一个全屏手势,调用系统的滑动返回功能
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    
    pan.delegate = self;
    
    [self.view addGestureRecognizer:pan];
    
}

#pragma mark - UIGestureRecognizerDelegate
// 判断是否允许触发当前手势
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    // 如果是根控制器,就触发手势
    return self.childViewControllers.count != 1;
}


#pragma mark - UINavigationControllerDelegate
//  当导航控制器的子控制器完全显示的时候调用
//- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    
//    // 如果显示的控制器为第0个子控制器
//    if (viewController == self.childViewControllers[0]) {
//        // 恢复手势代理
//        self.interactivePopGestureRecognizer.delegate = _popDelegate;
//    }
//}


//


// 每次跳转的时候调用,用于设置栈顶控制器左边的返回按钮
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    // 判断是否是根控制器
    if (self.childViewControllers.count != 0) { // 非根控制器
        
        // 清空返回手势的代理
//        self.interactivePopGestureRecognizer.delegate = nil;
        
        
        // 非根控制器隐藏底部tabBar按钮
        viewController.hidesBottomBarWhenPushed = YES;
        
        
        // 设置栈顶控制器左边的返回按钮
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalImageName:@"NavBack"] style:UIBarButtonItemStyleDone target:self action:@selector(back)];

    }else{
        viewController.hidesBottomBarWhenPushed = NO;
    }
    
    // 这个玩意竟然要写到这里了,先判断完了再调用父类的push方法,确保判断的准确性,push了再判断是不可以的
    [super pushViewController:viewController animated:animated];
}

- (void)back{
    
    [self popViewControllerAnimated:YES];
}

@end
