//
//  JBHomeMenuCell.h
//  MeiTuanDemo
//
//  Created by saifing on 16/9/20.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol JBHomeMenuCellDelegate <NSObject>

@optional
- (void)homeMenuCellClick:(long)sender;

@end

@interface JBHomeMenuCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView menuArray:(NSArray *)menuArray;

@property (nonatomic, weak) id <JBHomeMenuCellDelegate> delegate;
@end
