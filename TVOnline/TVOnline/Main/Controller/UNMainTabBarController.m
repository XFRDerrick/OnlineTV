//
//  UNMainTabBarController.m
//  TVOnline
//
//  Created by universe on 2016/12/27.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNMainTabBarController.h"

#import "UNNavHomeController.h"
#import "UNHomeController.h"

#import "UNColumnController.h"
#import "UNNavColumnController.h"

#import "UNMineViewController.h"
#import "UNNavMineController.h"

@interface UNMainTabBarController ()

@end

@implementation UNMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
    
    //Tabbar背景色
//    self.tabBar.barTintColor = [UIColor blackColor];
    //选染色
    self.tabBar.tintColor = [UIColor redColor];
    
}

- (void)setupUI{
    
    UNHomeController *homeVC = [[UNHomeController alloc] init];
    //
    homeVC.title = @"首页";
    [homeVC.tabBarItem setImage:[UIImage imageNamed:@"推荐_默认"]];
    [homeVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"推荐_焦点"]];

    UNNavHomeController *homeNav = [[UNNavHomeController alloc] initWithRootViewController:homeVC];
    [self addChildViewController:homeNav];
    
    //栏目
    UNColumnController *columnVC = [[UNColumnController alloc] initWithCellType:CollectionCellTypeColumn flowLayoutType:UNCollectionFlowLayoutTypeColumn requestPath:KColoumnPath];
    columnVC.automaticallyAdjustsScrollViewInsets = NO;
    columnVC.title = @"栏目";
    [columnVC.tabBarItem setImage:[UIImage imageNamed:@"栏目_默认"]];
    [columnVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"栏目_焦点"]];

    UNNavColumnController *columnNav = [[UNNavColumnController alloc] initWithRootViewController:columnVC];
    [self addChildViewController:columnNav];
    
    //直播
    UNColumnController *onlineVC = [[UNColumnController alloc] initWithCellType:CollectionCellTypeOnline flowLayoutType:UNCollectionFlowLayoutTypeOnline requestPath:KOnlinePath];
    onlineVC.automaticallyAdjustsScrollViewInsets = NO;
    onlineVC.title = @"直播";
    [onlineVC.tabBarItem setImage:[UIImage imageNamed:@"发现_默认"]];
    [onlineVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"发现_焦点"]];

    UNNavColumnController *onlineNav = [[UNNavColumnController alloc] initWithRootViewController:onlineVC];
    [self addChildViewController:onlineNav];
    
    
    //我的
    UNMineViewController *mineVc = [[UNMineViewController alloc] init];
    mineVc.title = @"我的";
    [mineVc.tabBarItem setImage:[UIImage imageNamed:@"我的_默认"]];
    [mineVc.tabBarItem setSelectedImage:[UIImage imageNamed:@"我的_焦点"]];

    UNNavMineController *mineNav = [[UNNavMineController alloc] initWithRootViewController:mineVc];
    [self addChildViewController:mineNav];

    self.selectedIndex = 0;
}

- (void)setupTabbarColor{

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
