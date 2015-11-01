//
//  ZJTabBarController.m
//  彩票彩票
//
//  Created by 侯宝伟 on 15/8/25.
//  Copyright (c) 2015年 ZHUNJIEE. All rights reserved.
//

#import "ZJTabBarController.h"
#import "ZJNavigationController.h"
#import "ZJArenaViewController.h"
#import "ZJDiscoverTableViewController.h"
#import "ZJHallTableViewController.h"
#import "ZJHistoryTableViewController.h"
#import "ZJLotteryViewController.h"
#import "ZJTabBar.h"
#import "ZJArenaNavigationController.h"

@interface ZJTabBarController () <ZJTabBarDelegate>

@property (nonatomic, strong) NSMutableArray *items;

@end



@implementation ZJTabBarController

- (NSMutableArray *)items{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 给TabBarVc添加子控制器
    [self setUpAllViewController];
    
    //
    [self setUpTabBar];
    
    
}

// 在TabBar控制器即将显示的时候去除系统控制器里的UITabBarButton
- (void)viewWillAppear:(BOOL)animated{
    
    // 一定要先写这玩意,这样所有的界面都加载完毕就等着显示了
    [super viewWillAppear:animated];

    // 遍历TabBar子控件干掉所有的UITabBarButton
    for (UIView *childView in self.tabBar.subviews) {
        if ([childView isKindOfClass:[ZJTabBar class]] == NO) {
            [childView removeFromSuperview];
        }
    }
    
}


// 自定义TabBar
- (void)setUpTabBar{
    // 移除系统的TabBar
//    [self.tabBar removeFromSuperview];
    
    // 一个对象如果没有被强引用,并不会马上被销毁
    // 当下次运行循环到来的时候,系统就会判断下当前有哪些对象需要销毁
    
    // 系统TabBar上的按钮是由对应的子控制器的TabBarItem决定
    
    ZJTabBar *tabBar = [[ZJTabBar alloc] init];
    // 给tabBar传递UITabBarItem模型数组
    tabBar.items = self.items;
    tabBar.frame = self.tabBar.bounds;
    
    tabBar.delegate = self;
    
    [self.tabBar addSubview:tabBar];
    
}

#pragma mark - ZJTabBarDelegate
// 点击TabBar上的按钮就会调用
- (void)tabBar:(ZJTabBar *)tabBar btnDidClick:(NSInteger)index{
    // 切换控制器
    self.selectedIndex = index;
}




// 添加所有控制器
- (void)setUpAllViewController{
    // 购彩大厅
    ZJHallTableViewController *hall = [[ZJHallTableViewController alloc] init];
    [self setUpOneChildViewController:hall image:[UIImage imageNamed:@"TabBar_LotteryHall_new"] selImage:[UIImage imageNamed:@"TabBar_LotteryHall_selected_new"] title:@"购彩大厅"];
    
    // 竞技场
    ZJArenaViewController *arena = [[ZJArenaViewController alloc] init];
    [self setUpOneChildViewController:arena image:[UIImage imageNamed:@"TabBar_Arena_new"] selImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"] title:@"竞技场"];
    
    // 发现
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ZJDiscoverTableViewController" bundle:nil];
    ZJDiscoverTableViewController *discover = [storyboard instantiateInitialViewController];
    
    [self setUpOneChildViewController:discover image:[UIImage imageNamed:@"TabBar_Discovery_new"] selImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"] title:@"发现"];
    
    // 开奖信息
    ZJHistoryTableViewController *history = [[ZJHistoryTableViewController alloc] init];
    [self setUpOneChildViewController:history image:[UIImage imageNamed:@"TabBar_History_new"] selImage:[UIImage imageNamed:@"TabBar_History_selected_new"] title:@"开奖信息"];
    
    // 我的彩票
    ZJLotteryViewController *myLottery = [[ZJLotteryViewController alloc] init];
    [self setUpOneChildViewController:myLottery image:[UIImage imageNamed:@"TabBar_MyLottery_new"] selImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"] title:@"我的彩票"];
}


// 添加一个子控制器
- (void)setUpOneChildViewController:(UIViewController *)viewController image:(UIImage *)image selImage:(UIImage *)selImage title:(NSString *)title{
    ZJNavigationController *nav = [[ZJNavigationController alloc] initWithRootViewController:viewController];
    
    if ([viewController isKindOfClass:[ZJArenaViewController class]]) {
        nav = [[ZJArenaNavigationController alloc] initWithRootViewController:viewController];
    }
    

    
    // 显示不被渲染的图片
    // 系统TabBar上的按钮是由对应的子控制器的TabBarItem决定
    // 把对应按钮的图片保存到对应子控制器的tabBarItem
    nav.tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置导航条标题
    viewController.title = title;
    
    [self.items addObject:nav.tabBarItem];
    
    [self addChildViewController:nav];
}
@end
