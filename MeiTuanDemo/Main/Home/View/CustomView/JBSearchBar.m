//
//  JBSearchBar.m
//  MeiTuanDemo
//
//  Created by saifing on 16/9/7.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#import "JBSearchBar.h"

@implementation JBSearchBar


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.font = [UIFont systemFontOfSize:13];
        
        self.background = [UIImage imageWithStretchableName:@"background_home_searchBar"];
        
        //设置左边的view
        UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_homepage_searchbar_left"]];
        imageV.width += 5;
        imageV.contentMode = UIViewContentModeCenter;
        self.leftView = imageV;
        // 一定要设置，想要显示搜索框左边的视图，一定要设置左边视图的模式
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    
    return self;
}


@end
