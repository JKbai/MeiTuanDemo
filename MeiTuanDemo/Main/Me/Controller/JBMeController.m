//
//  JBMeController.m
//  MeiTuanDemo
//
//  Created by saifing on 16/9/5.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#import "JBMeController.h"
#import "UINavigationBar+Awesome.h"

#define NAVBAR_CHANGE_POINT 50
@interface JBMeController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation JBMeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, -64, SCREEN_WIDTH, 180)];
    view.backgroundColor = [UIColor colorWithWholeRed:48 green:172 blue:159];
    [self.tableView addSubview:view];
    
    
    /** 右边的item */
    
    UIBarButtonItem *rightItem1 = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"icon_navigationItem_message_white"] highImage:[UIImage imageNamed:@"icon_navigationItem_message_white_highlighted"] target:self action:@selector(clickMessage) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem2 = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"icon_navigationItem_set_white"] highImage:[UIImage imageNamed:@"icon_navigationItem_set_highlighted"] target:self action:@selector(clickSet) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItems = @[rightItem2, rightItem1];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
}

#pragma mark 点击事件
/**
 *  右边item消息的点击事件
 */
- (void)clickMessage {
    XBLog(@"点击了右边消息item");
}

/**
 *  右边item设置的点击事件
 */
- (void)clickSet {
    XBLog(@"点击了右边设置item");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    self.tableView.delegate = self;
    [self scrollViewDidScroll:self.tableView];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.tableView.delegate = nil;
    [self.navigationController.navigationBar lt_reset];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    UIColor * color = [UIColor colorWithWholeRed:48 green:172 blue:159];
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > NAVBAR_CHANGE_POINT) {
        CGFloat alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64));
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
    } else {
        [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:0]];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = @"text";
    return cell;
}
\
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGFLOAT_MIN;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    
    return 50;
}

@end
