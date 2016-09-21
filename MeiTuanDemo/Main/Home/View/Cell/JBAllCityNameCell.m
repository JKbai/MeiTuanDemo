//
//  JBAllCityNameCell.m
//  MeiTuanDemo
//
//  Created by saifing on 16/9/20.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#import "JBAllCityNameCell.h"

@implementation JBAllCityNameCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)cellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath keys:(NSMutableArray *)keys cities:(NSMutableDictionary *)cities{
    static NSString *cellIndentifier = @"JBAllCityNameCell";
    JBAllCityNameCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[JBAllCityNameCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier cellForRowAtIndexPath:indexPath keys:keys cities:cities];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier cellForRowAtIndexPath:(NSIndexPath *)indexPath keys:(NSMutableArray *)keys cities:(NSMutableDictionary *)cities {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        NSString *key = [keys objectAtIndex:indexPath.section];
        self.textLabel.text = [[cities objectForKey:key] objectAtIndex:indexPath.row];
        
    }
    return self;
}


@end
