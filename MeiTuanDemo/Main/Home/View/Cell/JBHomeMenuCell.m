//
//  JBHomeMenuCell.m
//  MeiTuanDemo
//
//  Created by saifing on 16/9/20.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#import "JBHomeMenuCell.h"
#import "JBMenuBtnView.h"

@interface JBHomeMenuCell ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIView *firstBgView;
@property (nonatomic, strong) UIView *secondBgView;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation JBHomeMenuCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


+ (instancetype)cellWithTableView:(UITableView *)tableView menuArray:(NSArray *)menuArray {
    static NSString *menuID = @"menu";
    JBHomeMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:menuID];
    if (cell == nil) {
        cell = [[JBHomeMenuCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:menuID menuArray:menuArray];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier menuArray:(NSArray *)menuArray {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _firstBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 160)];
        _secondBgView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, 160)];
        
        UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180)];
        
        scrollView.delegate = self;
        
        //设置scrollView的滚动大小
        scrollView.contentSize = CGSizeMake(2 * SCREEN_WIDTH, 180);
        //是否分页
        scrollView.pagingEnabled = YES;
        //是否滚动
//        scrollView.scrollEnabled = NO;
        scrollView.showsHorizontalScrollIndicator = NO;
        
        [scrollView addSubview:_firstBgView];
        [scrollView addSubview:_secondBgView];
        [self addSubview:scrollView];
        
        //创建8个按钮
        for (int i = 0; i < 16; i++) {
            if (i < 4) {
             CGRect frame = CGRectMake(i * SCREEN_WIDTH / 4, 0, SCREEN_WIDTH / 4, 80);
                NSString *title = [menuArray[i] objectForKey:@"title"];
                NSString *imageStr = [menuArray[i] objectForKey:@"image"];
                JBMenuBtnView *btnView = [[JBMenuBtnView alloc]initWithFrame:frame title:title imageStr:imageStr];
                [_firstBgView addSubview:btnView];
                btnView.tag = 10+i;
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(OnTapBtnView:)];
                [btnView addGestureRecognizer:tap];
            } else if(i < 8){
                CGRect frame = CGRectMake((i-4) * SCREEN_WIDTH / 4, 80, SCREEN_WIDTH / 4, 80);
                NSString *title = [menuArray[i] objectForKey:@"title"];
                NSString *imageStr = [menuArray[i] objectForKey:@"image"];
                JBMenuBtnView *btnView = [[JBMenuBtnView alloc]initWithFrame:frame title:title imageStr:imageStr];
                 [_firstBgView addSubview:btnView];
                btnView.tag = 10+i;
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(OnTapBtnView:)];
                [btnView addGestureRecognizer:tap];
            }else if (i < 12){
                CGRect frame = CGRectMake((i - 8) * SCREEN_WIDTH / 4, 0, SCREEN_WIDTH / 4, 80);
                NSString *title = [menuArray[i] objectForKey:@"title"];
                NSString *imageStr = [menuArray[i] objectForKey:@"image"];
                JBMenuBtnView *btnView = [[JBMenuBtnView alloc]initWithFrame:frame title:title imageStr:imageStr];
                 [_secondBgView addSubview:btnView];
                btnView.tag = 10+i;
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(OnTapBtnView:)];
                [btnView addGestureRecognizer:tap];
            }else {
                CGRect frame = CGRectMake((i-12) * SCREEN_WIDTH / 4, 80, SCREEN_WIDTH / 4, 80);
                NSString *title = [menuArray[i] objectForKey:@"title"];
                NSString *imageStr = [menuArray[i] objectForKey:@"image"];
                JBMenuBtnView *btnView = [[JBMenuBtnView alloc]initWithFrame:frame title:title imageStr:imageStr];
                 [_secondBgView addSubview:btnView];
                btnView.tag = 10+i;
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(OnTapBtnView:)];
                [btnView addGestureRecognizer:tap];
            }
        }
        
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 35, 160, 0, 20)];
        _pageControl.currentPage = 0;
        _pageControl.numberOfPages = 2;
        _pageControl.currentPageIndicatorTintColor = navigationBarColor;
        _pageControl.pageIndicatorTintColor =  [UIColor grayColor];
        [self addSubview:_pageControl];
    }
    return self;
}

#pragma mark --scrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat scrollViewW = scrollView.frame.size.width;
    //算出水平移的距离
    CGFloat x = scrollView.contentOffset.x;
    int page = (x + scrollViewW / 2)/scrollViewW;
    _pageControl.currentPage = page;
}

//在这个地方搞一个代理通知控制器哪个按钮被点了 作出应以的处理
- (void)OnTapBtnView:(UITapGestureRecognizer *)sender {
    XBLog(@"%ld", (long)sender.view.tag);
    if ([self.delegate respondsToSelector:@selector(homeMenuCellClick:)]) {
        [self.delegate homeMenuCellClick:(NSUInteger)sender.view.tag];
    }
}

@end
