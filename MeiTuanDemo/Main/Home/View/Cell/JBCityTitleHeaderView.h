//
//  JBCityTitleHeaderView.h
//  MeiTuanDemo
//
//  Created by saifing on 16/9/20.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JBCityTitleHeaderView : UIView
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (nonatomic, copy) NSString *keyStr;

+ (instancetype)headViewWithTableView:(UITableView *)tableView;
@end
