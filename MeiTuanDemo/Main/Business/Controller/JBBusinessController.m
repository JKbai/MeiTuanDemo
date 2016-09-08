//
//  JBBusinessController.m
//  MeiTuanDemo
//
//  Created by saifing on 16/9/5.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#import "JBBusinessController.h"
#import "NYSegmentedControl.h"

@interface JBBusinessController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation JBBusinessController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavi];
    [self initTableView];
}

#pragma mark --初始化UI控件
- (void)setNavi {
    
    UIImage *bg_navigationBar_white = [UIImage imageWithStretchableName:@"bg_navigationBar_white"];
    
    [self.navigationController.navigationBar setBackgroundImage:bg_navigationBar_white forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    
    /** 左边的item按钮 */
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"icon_navigationItem_map"] highImage:[UIImage imageNamed:@"icon_navigationItem_map_selected"] target:self action:@selector(clickMap) forControlEvents:UIControlEventValueChanged];
    
    /** 中间的双消息segment */
    NYSegmentedControl *nysegmented = [[NYSegmentedControl alloc]initWithItems:@[@"全部商家",@"优惠商家"]];
    nysegmented.titleTextColor = [UIColor colorWithRed:0.157 green:0.592 blue:0.561 alpha:1.000];
    nysegmented.selectedTitleTextColor = [UIColor whiteColor];
    nysegmented.segmentIndicatorBackgroundColor = [UIColor colorWithRed:0.255 green:0.780 blue:0.745 alpha:1.000];
    nysegmented.backgroundColor = [UIColor whiteColor];
    nysegmented.borderWidth = 1.0f;
    nysegmented.borderColor = [UIColor colorWithRed:0.322 green:0.780 blue:0.745 alpha:1.000];
    nysegmented.segmentIndicatorBorderWidth = 1.0f;
    nysegmented.segmentIndicatorInset = 0.0f;
    nysegmented.segmentIndicatorBorderColor = self.view.backgroundColor;
    [nysegmented sizeToFit];
//    nysegmented.cornerRadius = CGRectGetHeight(nysegmented.frame) / 2.0f;
    nysegmented.cornerRadius = 5.0f;
//    nysegmented.segmentIndicatorGradientBottomColor = [UIColor whiteColor];
    [nysegmented addTarget:self action:@selector(segmentSelected:) forControlEvents:UIControlEventTouchUpInside];
    [nysegmented sizeToFit];
    self.navigationItem.titleView = nysegmented;
    
    /** 右边的item按钮 */
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"icon_navigationItem_search"] highImage:[UIImage imageNamed:@"icon_navigationItem_search_highlighted"] target:self action:@selector(clickSearchItem) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)initTableView{
    
}

#pragma mark --点击事件
/**
 *  左边item地图的点击事件
 */
- (void)clickMap {
    XBLog(@"点击了左边地图item");
}

/**
 *  右边item搜索的点击事件
 */
- (void)clickSearchItem {
    XBLog(@"点击了右边搜索Item");
}

/**
 *  双消息segmentControl的点击事件
 *
 *  @param nySegmentedControl 对应的segmentControl
 */
- (void)segmentSelected:(NYSegmentedControl *)nySegmentedControl {
    
}


@end
