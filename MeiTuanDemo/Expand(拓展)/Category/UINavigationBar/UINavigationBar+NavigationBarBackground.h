//
//  UINavigationBar+NavigationBarBackground.h
//  BXYTool
//
//  Created by saifing on 16/8/26.
//  Copyright © 2016年 saifing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (NavigationBarBackground)

/**
 *  设置NavigationBar的私有属性backgroundView的背景颜色
 *
 */
- (void)xb_setBackgroundViewWithColor:(UIColor *)backgroundColor;


/**
 *  设置NavigationBar的背景透明度
 * */
- (void)xb_setBackgroundViewWithAlpha:(CGFloat)alpha;

/**
 *  重设NavigationBar的背景样式为默认的样式
 */
- (void)xb_resetBackgroundDefaultStyle;

@end
