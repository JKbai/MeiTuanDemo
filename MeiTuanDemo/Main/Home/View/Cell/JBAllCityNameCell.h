//
//  JBAllCityNameCell.h
//  MeiTuanDemo
//
//  Created by saifing on 16/9/20.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JBAllCityNameCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath keys:(NSMutableArray *)keys cities:(NSMutableDictionary *)cities;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier cellForRowAtIndexPath:(NSIndexPath *)indexPath keys:(NSMutableArray *)keys cities:(NSMutableDictionary *)cities;

@end
