//
//  JBMenuController.m
//  MeiTuanDemo
//
//  Created by saifing on 16/9/20.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#import "JBMenuController.h"
#import "UIBarButtonItem+XBBarButtonItem.h"
@interface JBMenuController ()


@end

@implementation JBMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initNavi];
}

- (void)initNavi {
    self.title = self.titleStr;
    UIBarButtonItem *leftItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"icon_navigationItem_back_white"] highImage:[UIImage imageNamed:@"icon_navigationItem_back_white_highlighted"] target:self action:@selector(OnBackBtn) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = leftItem;
    self.hidesBottomBarWhenPushed = YES;
}
- (void)OnBackBtn {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
