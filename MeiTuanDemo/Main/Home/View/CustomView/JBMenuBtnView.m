//
//  JBMenuBtnView.m
//  MeiTuanDemo
//
//  Created by saifing on 16/9/20.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#import "JBMenuBtnView.h"

@implementation JBMenuBtnView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame title:(NSString *)title imageStr:(NSString *)imageStr {
    self = [super initWithFrame:frame];
    
    if (self) {
        //菜单图标
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width /2 - 22, 15, 44, 44)];
        imageView.image = [UIImage imageNamed:imageStr];
        [self addSubview:imageView];
        
        //菜单标题
        UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 15+44, frame.size.width, 20)];
        titleLable.text = title;
        titleLable.textAlignment = NSTextAlignmentCenter;
        titleLable.font = [UIFont systemFontOfSize:13];
        [self addSubview:titleLable];
        
    }
    return self;
}

@end
