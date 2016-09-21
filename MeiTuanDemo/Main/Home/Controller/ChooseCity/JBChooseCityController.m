//
//  JBChooseCityController.m
//  MeiTuanDemo
//
//  Created by saifing on 16/9/7.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#import "JBChooseCityController.h"
#import "UITableView+JBTableView.h"
#import "JBHotCityNameCell.h"
#import "JBAllCityNameCell.h"
#import "JBCityTitleHeaderView.h"
#import "JBHomeController.h"

@interface JBChooseCityController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *jbTableView;
@property (nonatomic, strong) NSMutableDictionary *cities;

@property (nonatomic, strong) NSMutableArray *keys; //城市首字母
@property (nonatomic, strong) NSMutableArray *arrayCitys;   //城市数据
@property (nonatomic, strong) NSMutableArray *arrayHotCity;
@end

@implementation JBChooseCityController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.arrayHotCity = [NSMutableArray arrayWithObjects:@"广州市",@"北京市",@"天津市",@"西安市",@"重庆市",@"沈阳市",@"青岛市",@"济南市",@"深圳市",@"长沙市",@"无锡市", nil];
        self.keys = [NSMutableArray array];
        self.arrayCitys = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavi];
    [self getCityData];
    [self initTableView];
    
}

- (void)initTableView {
    self.jbTableView = [UITableView initWithTableView:self.view.frame withDelegate:self];
    self.jbTableView.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
    [self.view addSubview:self.jbTableView];
}


- (void)getCityData {
    NSString *path=[[NSBundle mainBundle] pathForResource:@"citydict"
                                                   ofType:@"plist"];
    self.cities = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    [self.keys addObjectsFromArray:[[self.cities allKeys] sortedArrayUsingSelector:@selector(compare:)]];
    
    //添加热门城市
    NSString *strHot = @"热";
    [self.keys insertObject:strHot atIndex:0];
    [self.cities setObject:_arrayHotCity forKey:strHot];
}

#pragma mark --tableView的代理方法和数据源方法

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _keys;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _keys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        NSString *key = [_keys objectAtIndex:section];
        NSArray *citySection = [_cities objectForKey:key];
        return citySection.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.section == 0) {
        JBHotCityNameCell *cell = [JBHotCityNameCell cellWithTableView:tableView hotCityArray:self.arrayHotCity];
        return cell;
    } else {
        JBAllCityNameCell *cell = [JBAllCityNameCell cellWithTableView:tableView cellForRowAtIndexPath:indexPath keys:self.keys cities:self.cities];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        XBLog(@"");
    } else {
        [self.delegate passValueWithCity:@"西安"];
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSString *key = [_keys objectAtIndex:section];
    JBCityTitleHeaderView *headerView = [JBCityTitleHeaderView headViewWithTableView:tableView];
    headerView.keyStr = key;
    return headerView;
}




- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20.0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 250;
    } else {
        return 44;
    }
}

#pragma mark --导航条的设置
- (void)setNavi {
    self.title = @"选择城市";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"icon_navigationItem_dismiss"] highImage:[UIImage imageNamed:@"icon_navigationItem_dismiss_highlighted"] target:self action:@selector(clickBack) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark -- 导航条上的点击事件
- (void)clickBack {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
