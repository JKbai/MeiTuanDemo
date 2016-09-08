//
//  JBChooseCityController.m
//  MeiTuanDemo
//
//  Created by saifing on 16/9/7.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#import "JBChooseCityController.h"

@implementation JBChooseCityController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"icon_navigationItem_dismiss"] highImage:[UIImage imageNamed:@"icon_navigationItem_dismiss_highlighted"] target:self action:@selector(clickBack) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark -- 导航控制器上的点击事件
- (void)clickBack {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
