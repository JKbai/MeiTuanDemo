//
//  JBHotCityNameCell.m
//  MeiTuanDemo
//
//  Created by saifing on 16/9/20.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#import "JBHotCityNameCell.h"

@implementation JBHotCityNameCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)cellWithTableView:(UITableView *)tableView hotCityArray:(NSArray *)hotCityArray{
    static NSString *cellIndentifier = @"JBHotCityNameCell";
    JBHotCityNameCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[JBHotCityNameCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier hotCityArray:hotCityArray];
        cell.contentView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier hotCityArray:(NSArray *)hotCityArray{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        int totalloc = 3;
        
        CGFloat buttonw = 70;
        CGFloat buttonh = 30;
        
        //算出间距 self.frame.size.width
        CGFloat margin=(self.frame.size.width - totalloc * buttonw) / (totalloc + 1);
        //int count=11;
        for (int i = 0; i < hotCityArray.count; i++) {
            
            int row = i / totalloc;//行号
            //0/3=0,1/3=0,2/3=1; (i 从0到2都是第一行) i＝ 3的时候第二行
            
            int loc = i % totalloc;//列号
            
            //横坐标
            CGFloat buttonx = margin + (margin + buttonw) * loc;
            
            //纵坐标
            CGFloat buttony = margin + (margin + buttonh) * row;
            
            //创建uiview控件
            UIButton *areaButton=[[UIButton alloc]initWithFrame:CGRectMake(buttonx, buttony, buttonw, buttonh)];
            [areaButton setTintColor:[UIColor blackColor]];
            [areaButton setTitle:hotCityArray[i] forState:UIControlStateNormal];
            [areaButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [areaButton setBackgroundColor: [UIColor whiteColor]]
            ;
            [areaButton addTarget:self action:@selector(hotCityButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:areaButton];
            areaButton.layer.masksToBounds = YES;
            areaButton.layer.cornerRadius = 3.0;
        }
    }
    
    return self;
    
}
-(void)hotCityButtonClick:(UIButton *)button {
    
}

@end
