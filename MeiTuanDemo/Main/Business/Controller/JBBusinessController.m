//
//  JBBusinessController.m
//  MeiTuanDemo
//
//  Created by saifing on 16/9/5.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#import "JBBusinessController.h"
#import "NYSegmentedControl.h"
#import "JSDropDownMenu.h"
@interface JBBusinessController ()<JSDropDownMenuDataSource,JSDropDownMenuDelegate>{
    
    NSMutableArray *_data1;
    NSMutableArray *_data2;
    NSMutableArray *_data3;
    
    NSInteger _currentData1Index;
    NSInteger _currentData2Index;
    NSInteger _currentData3Index;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *menuHeaderView;

@property (nonatomic, strong) JSDropDownMenu *dropDownMenu;
@end

@implementation JBBusinessController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavi];
    [self initTableView];
    [self initDropDownMenu];
}

#pragma mark --初始化UI控件
- (void)setNavi {
    
    UIImage *bg_navigationBar_white = [UIImage imageWithStretchableName:@"bg_navigationBar_white"];
    
    [self.navigationController.navigationBar setBackgroundImage:bg_navigationBar_white forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    
    /** 左边的item按钮 */
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"icon_navigationItem_map"] highImage:[UIImage imageNamed:@"icon_navigationItem_map_selected"] target:self action:@selector(clickMap) forControlEvents:UIControlEventValueChanged];
    
    /** 中间的双消息segment */
    NYSegmentedControl *nysegmented = [[NYSegmentedControl alloc]initWithItems:@[@"全部商家",@"优惠商家"]];
    nysegmented.titleTextColor = [UIColor colorWithRed:0.157 green:0.592 blue:0.561 alpha:1.000];
    nysegmented.selectedTitleTextColor = [UIColor whiteColor];
    nysegmented.segmentIndicatorBackgroundColor = [UIColor colorWithRed:0.255 green:0.780 blue:0.745 alpha:1.000];
    nysegmented.backgroundColor = [UIColor whiteColor];
    nysegmented.borderWidth = 1.0f;
    nysegmented.borderColor = [UIColor colorWithRed:0.322 green:0.780 blue:0.745 alpha:1.000];
    nysegmented.segmentIndicatorBorderWidth = 1.0f;
    nysegmented.segmentIndicatorInset = 0.0f;
    nysegmented.segmentIndicatorBorderColor = self.view.backgroundColor;
    [nysegmented sizeToFit];
//    nysegmented.cornerRadius = CGRectGetHeight(nysegmented.frame) / 2.0f;
    nysegmented.cornerRadius = 5.0f;
//    nysegmented.segmentIndicatorGradientBottomColor = [UIColor whiteColor];
    [nysegmented addTarget:self action:@selector(segmentSelected:) forControlEvents:UIControlEventTouchUpInside];
    [nysegmented sizeToFit];
    self.navigationItem.titleView = nysegmented;
    
    /** 右边的item按钮 */
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"icon_navigationItem_search"] highImage:[UIImage imageNamed:@"icon_navigationItem_search_highlighted"] target:self action:@selector(clickSearchItem) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)initTableView{
    
}

- (void)initDropDownMenu {
    NSArray *food = @[@"全部美食", @"火锅", @"川菜", @"西餐", @"自助餐", @"粤菜", @"湘菜"];
    NSArray *travel = @[@"全部旅游", @"周边游", @"景点门票", @"国内游", @"境外游"];
    NSArray *perfect = @[@"全部", @"美发", @"美甲", @"美容", @"瑜伽"];
    _data1 = [NSMutableArray arrayWithObjects:@{@"title":@"美食", @"data":food}, @{@"title":@"旅游", @"data":travel},@{@"title": @"丽人", @"data":perfect}, nil];
    _data2 = [NSMutableArray arrayWithObjects:@"智能排序", @"离我最近", @"评价最高", @"最新发布", @"人气最高", @"价格最低", @"价格最高", nil];
    _data3 = [NSMutableArray arrayWithObjects:@"不限人数", @"单人餐", @"双人餐", @"3~4人餐", nil];
    
    JSDropDownMenu *menu = [[JSDropDownMenu alloc] initWithOrigin:CGPointMake(0, 64) andHeight:40];
    menu.indicatorColor = [UIColor whiteColor];
    menu.separatorColor = [UIColor colorWithRed:210.0f/255.0f green:210.0f/255.0f blue:210.0f/255.0f alpha:1.0];
    menu.textColor = [UIColor colorWithRed:83.f/255.0f green:83.f/255.0f blue:83.f/255.0f alpha:1.0f];
    menu.dataSource = self;
    menu.delegate = self;
    self.dropDownMenu = menu;
    [self.view addSubview:menu];
}

#pragma mark --JSDropDownMenuDelegate

- (NSInteger)numberOfColumnsInMenu:(JSDropDownMenu *)menu {
    
    return 3;
}

-(BOOL)displayByCollectionViewInColumn:(NSInteger)column{
    
    if (column==2) {
        
        return YES;
    }
    
    return NO;
}

-(BOOL)haveRightTableViewInColumn:(NSInteger)column{
    
    if (column==0) {
        return YES;
    }
    return NO;
}

-(CGFloat)widthRatioOfLeftColumn:(NSInteger)column{
    
    if (column==0) {
        return 0.3;
    }
    
    return 1;
}

-(NSInteger)currentLeftSelectedRow:(NSInteger)column{
    
    if (column==0) {
        
        return _currentData1Index;
        
    }
    if (column==1) {
        
        return _currentData2Index;
    }
    
    return 0;
}

- (NSInteger)menu:(JSDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow{
    
    if (column==0) {
        if (leftOrRight==0) {
            
            return _data1.count;
        } else{
            
            NSDictionary *menuDic = [_data1 objectAtIndex:leftRow];
            return [[menuDic objectForKey:@"data"] count];
        }
    } else if (column==1){
        
        return _data2.count;
        
    } else if (column==2){
        
        return _data3.count;
    }
    
    return 0;
}

- (NSString *)menu:(JSDropDownMenu *)menu titleForColumn:(NSInteger)column{
    
    switch (column) {
        case 0: return [[_data1[0] objectForKey:@"data"] objectAtIndex:0];
            break;
        case 1: return _data2[0];
            break;
        case 2: return _data3[0];
            break;
        default:
            return nil;
            break;
    }
}

- (NSString *)menu:(JSDropDownMenu *)menu titleForRowAtIndexPath:(JSIndexPath *)indexPath {
    
    if (indexPath.column==0) {
        if (indexPath.leftOrRight==0) {
            NSDictionary *menuDic = [_data1 objectAtIndex:indexPath.row];
            return [menuDic objectForKey:@"title"];
        } else{
            NSInteger leftRow = indexPath.leftRow;
            NSDictionary *menuDic = [_data1 objectAtIndex:leftRow];
            return [[menuDic objectForKey:@"data"] objectAtIndex:indexPath.row];
        }
    } else if (indexPath.column==1) {
        
        return _data2[indexPath.row];
        
    } else {
        
        return _data3[indexPath.row];
    }
}

- (void)menu:(JSDropDownMenu *)menu didSelectRowAtIndexPath:(JSIndexPath *)indexPath {
    
    if (indexPath.column == 0) {
        
        if(indexPath.leftOrRight==0){
            
            _currentData1Index = indexPath.row;
            
            return;
        }
        
    } else if(indexPath.column == 1){
        
        _currentData2Index = indexPath.row;
        
    } else{
        
        _currentData3Index = indexPath.row;
    }
}


#pragma mark --点击事件
/**
 *  左边item地图的点击事件
 */
- (void)clickMap {
    XBLog(@"点击了左边地图item");
}

/**
 *  右边item搜索的点击事件
 */
- (void)clickSearchItem {
    XBLog(@"点击了右边搜索Item");
}

/**
 *  双消息segmentControl的点击事件
 *
 *  @param nySegmentedControl 对应的segmentControl
 */
- (void)segmentSelected:(NYSegmentedControl *)nySegmentedControl {
    
}


@end
