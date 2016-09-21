//
//  JBHotCityNameCell.h
//  MeiTuanDemo
//
//  Created by saifing on 16/9/20.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JBHotCityNameCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView hotCityArray:(NSArray *)hotCityArray;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier hotCityArray:(NSArray *)hotCityArray;
@end
