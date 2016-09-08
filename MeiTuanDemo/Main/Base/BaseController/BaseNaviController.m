//
//  BaseNaviController.m
//  MeiTuanDemo
//
//  Created by saifing on 16/9/5.
//  Copyright © 2016年 baiyinxiao. All rights reserved.
//

#import "BaseNaviController.h"
#import "UIImage+XBCategory.h"

@interface BaseNaviController ()

@end

@implementation BaseNaviController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    
    if (self) {
        
        
        UIImage *bg_navigationBar = [UIImage imageWithStretchableName:@"bg_navigationBar"];
        
        [self.navigationBar setBackgroundImage:bg_navigationBar forBarMetrics:UIBarMetricsDefault];
        self.navigationBar.barStyle = UIBarStyleBlackOpaque;
        
//        [self.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithWholeRed:48 green:172 blue:159]] forBarMetrics:UIBarMetricsDefault];
//        self.navigationBar.barStyle = UIBarStyleBlackOpaque;
    }
    return self;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
