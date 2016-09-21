//
//  JBMoreViewController.m
//  MeiTuanDemo
//
//  Created by saifing on 16/9/5.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#import "JBMoreViewController.h"

@interface JBMoreViewController ()

@end

@implementation JBMoreViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    [self setNavi];
}

- (void)setNavi {
    /** 设置navigationBar的背景 */
    UIImage *bg_navigationBar_white = [UIImage imageWithStretchableName:@"bg_navigationBar_white"];
    
    [self.navigationController.navigationBar setBackgroundImage:bg_navigationBar_white forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.title = @"更多";
    
    
}
@end
