//
//  JBHomeController.m
//  MeiTuanDemo
//
//  Created by saifing on 16/9/5.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#import "JBHomeController.h"
#import "UIBarButtonItem+XBBarButtonItem.h"
#import "UIButton+MiddleAligning.h"
@interface JBHomeController ()

@end

@implementation JBHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavi];
}

- (void)setNavi {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.backgroundColor = [UIColor grayColor]; //加上背景颜色，方便观察Button的大小

    UIImage *imageForButton = [UIImage imageNamed:@"icon_homepage_downArrow"];
    [button setImage:imageForButton forState:UIControlStateNormal];
    
    NSString *buttonTitleStr = @"北京";
    [button setTitle:buttonTitleStr forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    CGSize buttonTitleLabelSize = [buttonTitleStr sizeWithAttributes:@{NSFontAttributeName:button.titleLabel.font}]; //文本尺寸
    CGSize buttonImageSize = imageForButton.size;   //图片尺寸
    button.frame = CGRectMake(0,0,
                              buttonImageSize.width + buttonTitleLabelSize.width +10,
                              buttonImageSize.height +10);
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    
}

#pragma mark -导航条上的点击事件
- (void)clickCity {
    
}


@end
