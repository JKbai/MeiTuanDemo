//
//  JBCustombutton.m
//  MeiTuanDemo
//
//  Created by saifing on 16/9/7.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//  自定义一个图片在右文字在左的按钮

#import "JBCustombutton.h"

@implementation JBCustombutton

/**
 *  重写layoutSubview方法,自定义一个图片在右文字在左的按钮
 */
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    /**修改title的frame */
    
    //1.获取titlelable的frame
    CGRect titlelableFrame = self.titleLabel.frame;
    //2.修改titlelable的frame
    titlelableFrame.origin.x = 0;
    //3.重新赋值
    self.titleLabel.frame = titlelableFrame;
    
    
    /** 修改imageview的frame */
    
    //1.获取image的frame
    CGRect imageViewFrame = self.imageView.frame;
    //2.修改image的frame
    imageViewFrame.origin.x = titlelableFrame.size.width;
    //3.重新赋值
    self.imageView.frame = imageViewFrame;
    
}

@end
