//
//  JBHomeController.m
//  MeiTuanDemo
//
//  Created by saifing on 16/9/5.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#import "JBHomeController.h"

#import "JBCustombutton.h"
#import "JBChooseCityController.h"
#import "JBSearchBar.h"

#import "MJRefresh.h"

@interface JBHomeController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) NSTimer *timer;
@property (nonatomic, assign) int time;
@end

@implementation JBHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavi];
    [self initTableView];
}

#pragma mark --UI界面设计

/**
 *  初始化tableView
 */
- (void)initTableView {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self setUpTableView];
}

/**
 *  设置tableView的刷新动画
 */
- (void)setUpTableView {
    
    /** 添加下拉的动画图片 */
    //设置下拉刷新回调
    NSMutableArray *refreshImages = [[NSMutableArray alloc]init];
    UIImage *refreshimage1 = [UIImage imageNamed:@"icon_pull_animation_4"];
    UIImage *refreshimage2 = [UIImage imageNamed:@"icon_pull_animation_5"];
    
    [refreshimage1 cropImageWithSize:CGSizeMake(30, 30)];
    [refreshimage2 cropImageWithSize:CGSizeMake(30, 30)];
    
    [refreshImages addObject:refreshimage2];
    [refreshImages addObject:refreshimage1];
    
    NSMutableArray *stateIdleImages = [[NSMutableArray alloc]init];
    UIImage *stateIdleImage1 = [UIImage imageNamed:@"icon_pull_animation_1"];
    UIImage *stateIdleImage2 = [UIImage imageNamed:@"icon_pull_animation_2"];
    UIImage *stateIdleImage3 = [UIImage imageNamed:@"icon_pull_animation_3"];
    
    [stateIdleImage1 cropImageWithSize:CGSizeMake(30, 30)];
    [stateIdleImage1 cropImageWithSize:CGSizeMake(30, 30)];
    [stateIdleImage1 cropImageWithSize:CGSizeMake(30, 30)];
    
    [stateIdleImages addObject:stateIdleImage3];
    [stateIdleImages addObject:stateIdleImage2];
    [stateIdleImages addObject:stateIdleImage1];
    
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    //即将刷新的状态动画
    [header setImages:stateIdleImages forState:MJRefreshStateIdle];
    //正在刷新的动画
    [header setImages:refreshImages forState:MJRefreshStateRefreshing];
    //松开开始刷新的动画
    [header setImages:refreshImages forState:MJRefreshStatePulling];
  
    self.tableView.mj_header = header;
    
    
    /** 隐藏刷新时间lable */
    header.lastUpdatedTimeLabel.hidden = YES;
    
    /** 隐藏属性状态 */
    header.stateLabel.hidden = YES;
}

- (void)loadNewData {
    
    
    //模拟刷新的时间
    self.timer  =[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeAction) userInfo:nil repeats:YES];
    self.time = 5;
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^{
//        //
////        [self getRushBuyData];
////        [self getHotQueueData];
////        [self getRecommendData];
////        [self getDiscountData];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            //update UI
//        });
//    });
}

- (void)timeAction {
    self.time --;
    NSLog(@"%d",self.time);
    if (self.time == 0) {
        //		刷新数据
        [_tableView reloadData];
        //		停止刷新
        [_tableView.mj_header endRefreshing];
        [self.timer invalidate];
    }
}


#pragma mark --tableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[UITableViewCell alloc]init];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}



//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return <#footerHeight#>
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return <#hearderHeight#>
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return <#rowHeight#>;
//}

/**
 *  设置NavigationBar上面的item
 */
- (void)setNavi {
    /** 1.自定义leftBarButoonitem(选择城市)  */
    JBCustombutton *leftCityBtn = [JBCustombutton buttonWithType:UIButtonTypeCustom];
//    leftCityBtn.backgroundColor = [UIColor grayColor];
    leftCityBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [leftCityBtn addTarget:self action:@selector(clickCity) forControlEvents:UIControlEventTouchUpInside];
    
    NSString *buttonTitleStr = @"北京";
    [leftCityBtn setTitle:buttonTitleStr forState:UIControlStateNormal];
    
    UIImage *imageForButton = [UIImage imageNamed:@"icon_homepage_downArrow"];
    [leftCityBtn setImage:imageForButton forState:UIControlStateNormal];
    CGSize buttonTitleLabelSize = [buttonTitleStr sizeWithAttributes:@{NSFontAttributeName:leftCityBtn.titleLabel.font}]; //文本尺寸
    CGSize buttonImageSize = imageForButton.size;
    
    leftCityBtn.frame = CGRectMake(0, 0, buttonTitleLabelSize.width + buttonImageSize.width, 30);
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftCityBtn];
    
    /** 2.中间的titleView搜索框 */

    JBSearchBar *searchBar = [[JBSearchBar alloc]initWithFrame:CGRectMake(0, 0, 220, 25)];
    searchBar.placeholder = @"输入商家,品类,商圈";
    self.navigationItem.titleView = searchBar;
    
    
    /** 右边的item */
    
    UIBarButtonItem *rightItem1 = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"icon_navigationItem_scan_white"] highImage:[UIImage imageNamed:@"icon_navigationItem_scan_white_highlighted"] target:self action:@selector(clickScan) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem2 = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"icon_navigationItem_message_white"] highImage:[UIImage imageNamed:@"icon_navigationItem_message_white_highlighted"] target:self action:@selector(clickMessage) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItems = @[rightItem2, rightItem1];
    
    
    
}

#pragma mark -导航条上的点击事件
/**
 *  点击城市item
 */
- (void)clickCity {
    
    JBChooseCityController *chooseCityVC = [[JBChooseCityController alloc]init];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:chooseCityVC];
    
    [self presentViewController:navi animated:YES completion:^{
        
    }];
}

/**
 *  点击二维码item
 */
- (void)clickScan {
    XBLog(@"点击二维码item");
}

/**
 *  点击消息item
 */
- (void)clickMessage {
    XBLog(@"点击消息item");
}

@end
