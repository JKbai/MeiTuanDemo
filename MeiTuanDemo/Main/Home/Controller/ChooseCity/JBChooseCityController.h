//
//  JBChooseCityController.h
//  MeiTuanDemo
//
//  Created by saifing on 16/9/7.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#import "BaseViewController.h"

@protocol JBChooseCityControllerDelegate <NSObject>

- (void)passValueWithCity:(NSString *)city;

@end

@interface JBChooseCityController : BaseViewController


@property (nonatomic, weak) id <JBChooseCityControllerDelegate> delegate;

@end
