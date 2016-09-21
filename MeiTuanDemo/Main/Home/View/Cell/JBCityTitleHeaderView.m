//
//  JBCityTitleHeaderView.m
//  MeiTuanDemo
//
//  Created by saifing on 16/9/20.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#import "JBCityTitleHeaderView.h"

@implementation JBCityTitleHeaderView


+ (instancetype)headViewWithTableView:(UITableView *)tableView {
    static NSString *ID = @"JBCityTitleHeaderView";
    JBCityTitleHeaderView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headView == nil) {
        // 从xib中加载cell
        headView = [[[NSBundle mainBundle] loadNibNamed:@"JBCityTitleHeaderView" owner:nil options:nil] lastObject];
    }
    headView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    return headView;
}

-(void)setKeyStr:(NSString *)keyStr{
    _keyStr = keyStr;
    self.titleLable.text = keyStr;
}

@end
