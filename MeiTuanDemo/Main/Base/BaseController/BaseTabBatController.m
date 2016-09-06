//
//  BaseTabBatController.m
//  MeiTuanDemo
//
//  Created by saifing on 16/9/5.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#import "BaseTabBatController.h"
#import "BaseNaviController.h"

#import "JBHomeController.h"
#import "JBBusinessController.h"
#import "JBMeController.h"
#import "JBMoreViewController.h"



@interface BaseTabBatController ()

@end

@implementation BaseTabBatController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupTabBarController];
        self.tabBar.selectedImageTintColor = [UIColor colorWithWholeRed:48 green:172 blue:159];
        
        //设置tabBar的背景颜色
        UIView *view = [[UIView alloc]initWithFrame:self.tabBar.bounds];
        view.backgroundColor = [UIColor whiteColor];
        [[UITabBar appearance]insertSubview:view atIndex:0];
    }
    return self;
}


- (void)setupTabBarController {
    //设置tabBar属性数组
    self.tabBarItemsAttributes = [self tabBarItemsAttributesForController];
    
    //设置控制器数组
    self.viewControllers = [self mtViewControllers];
    
    self.delegate = self;
    self.moreNavigationController.navigationBarHidden = YES;
}

/**
 *  设置控制器
 */

- (NSArray *)mtViewControllers {
    //首页
    JBHomeController *home = [[JBHomeController alloc]init];
    
    UINavigationController *navi1 = [[BaseNaviController alloc]initWithRootViewController:home];
    
    //商家
    JBBusinessController *business = [[JBBusinessController alloc]init];
    
    UINavigationController *navi2 = [[BaseNaviController alloc]initWithRootViewController:business];
    
    //我
    JBMeController *me = [[JBMeController alloc]init];
    
    UINavigationController *navi3 = [[BaseNaviController alloc]initWithRootViewController:me];
    
    //更多
    JBMoreViewController *more = [[JBMoreViewController alloc]init];
    
    UINavigationController *navi4 = [[BaseNaviController alloc]initWithRootViewController:more];
  
    NSArray *viewControllers = @[
                                 navi1,
                                 navi2,
                                 navi3,
                                 navi4
                                 ];
    
    
    return viewControllers;
}

/**
 *  TabBar文字和图片设置
 */
- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *home =@{
                          CYLTabBarItemTitle: @"首页",
                          CYLTabBarItemImage: @"icon_tabbar_homepage",
                          CYLTabBarItemSelectedImage : @"icon_tabbar_homepage_selected"
                          
                          };
    NSDictionary *business =@{
                          CYLTabBarItemTitle: @"商家",
                          CYLTabBarItemImage: @"icon_tabbar_merchant_normal",
                          CYLTabBarItemSelectedImage : @"icon_tabbar_merchant_selected"
                          
                          };
    
    NSDictionary *me =@{
                          CYLTabBarItemTitle: @"我的",
                          CYLTabBarItemImage: @"icon_tabbar_mine",
                          CYLTabBarItemSelectedImage : @"icon_tabbar_mine_selected"
                          
                          };
    
    NSDictionary *more =@{
                          CYLTabBarItemTitle: @"更多",
                          CYLTabBarItemImage: @"icon_tabbar_misc",
                          CYLTabBarItemSelectedImage : @"icon_tabbar_misc_selected"
                          
                          };
    NSArray *items = @[
                       home,
                       business,
                       me,
                       more
                       ];
    return items;
}


#pragma mark - UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController*)tabBarController shouldSelectViewController:(UINavigationController*)viewController {
    /// 特殊处理 - 是否需要登录
    BOOL isBaiDuService = [viewController.topViewController isKindOfClass:[JBBusinessController class]];
    if (isBaiDuService) {
//        NSLog(@"你点击了TabBar第二个");
        XBLog(@"你点击了商家tabBar");
    }
    return YES;
}


@end
