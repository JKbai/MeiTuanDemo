//
//  UIBarButtonItem+XBBarButtonItem.h
//  MeiTuanDemo
//
//  Created by saifing on 16/9/6.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (XBBarButtonItem)



/**
 *  设置item的属性
 *
 *  @param image         默认图片
 *  @param highImage     高亮图片
 *  @param target        目标
 *  @param action        点击方法
 *  @param controlEvents 控制事件
 *
 *  @return 新的item
 */
+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

/**
 *根据图片快速创建一个UIBarButtonItem，自定义大小
 */
+ (UIBarButtonItem *)initWithNormalImage:(NSString *)image target:(id)target action:(SEL)action width:(CGFloat)width height:(CGFloat)height;

@end
