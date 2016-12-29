//
//  UNHomeController.m
//  TVOnline
//
//  Created by universe on 2016/12/27.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNHomeController.h"

#import "RecommendModel.h"

#import "UNColumnController.h"
#import "UNRecommendController.h"

#import "UNOnlineViewFlowLayout.h"

@interface UNHomeController ()

@property (nonatomic, strong) NSMutableArray<RecommendRoomModel *> *datas;

@end

@implementation UNHomeController
- (NSMutableArray<RecommendRoomModel *> *)datas{
    if (!_datas) {
        _datas = [NSMutableArray array];
    }
    return _datas;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.menuBGColor = [UIColor whiteColor];
        self.menuHeight = 40;
        self.menuViewStyle = WMMenuViewStyleFlood;
        self.progressColor = KRGB_Color(235, 235, 235, 1);
        
        self.progressViewIsNaughty = YES;
        self.automaticallyCalculatesItemWidths = YES;
        
        self.itemMargin= 20;
        self.titleSizeNormal = 16;
        self.titleSizeSelected = 16;

        self.menuBGColor = [UIColor whiteColor];
        self.titleColorSelected =  [UIColor redColor];
        //预加载无限制
        self.preloadPolicy =WMPageControllerCachePolicyNoLimit;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    //先进行加载后加载页面
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
    
        [NetWorkTools getRecommendModelWithPath:KRecommendPath completionHandler:^(RecommendModel *model, NSError *error) {
            if (!error) {
                NSLog(@"数据请求成功");
                [self.datas removeAllObjects];
                [self.datas addObjectsFromArray:model.room];
            }else{
                NSLog(@"数据请求失败");
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [self reloadData];
            });
            
        }];
    });
    
}


#pragma mark wmpageController 实现


- (NSArray<NSString *> *)titles{
    
    NSMutableArray *needTitles = [NSMutableArray array];
    int count = 1;
    for (RecommendRoomModel *model in self.datas) {
        if (count == 11) {
            break;
        }
        if ([model.name isEqualToString:@"精彩推荐"]) {
            [needTitles addObject:@"推荐"];
            [needTitles addObject:@"全部"];
        }else{
            [needTitles addObject:model.name];
        }
        count ++;
    }
    return needTitles.copy;
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{

    return self.titles.count;
    
}

- (NSString *)menuView:(WMMenuView *)menu titleAtIndex:(NSInteger)index{
    
    return self.titles[index];
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    
    UNColumnController *pageVC  = nil;
    if (index == 0) {
        
        UNRecommendController *recoVC = [[UNRecommendController alloc] initWithCollectionViewLayout:[[UNOnlineViewFlowLayout alloc] init]];
        recoVC.datas = self.datas;
        recoVC.view.backgroundColor = [UIColor whiteColor];
        return recoVC;
  
    }else if(index == 1){
       
        NSString *path = @"http://www.quanmin.tv/json/play/list.json";
        pageVC = [[UNColumnController alloc] initWithCellType:CollectionCellTypeOnline flowLayoutType:UNCollectionFlowLayoutTypeOnline requestPath:path];
        
        
    }else if(index == 2){
        NSString *path = [NSString stringWithFormat:@"http://www.quanmin.tv/json/categories/%@/list.json",self.datas[index-1].slug];
        pageVC = [[UNColumnController alloc] initWithCellType:CollectionCellTypeLove flowLayoutType:UNCollectionFlowLayoutTypeLove requestPath:path];
        
      
    }else{
        NSString *path = [NSString stringWithFormat:@"http://www.quanmin.tv/json/categories/%@/list.json",self.datas[index-1].slug];
        pageVC = [[UNColumnController alloc] initWithCellType:CollectionCellTypeOnline flowLayoutType:UNCollectionFlowLayoutTypeOnline requestPath:path];
    }
    
    pageVC.automaticallyAdjustsScrollViewInsets = YES;
    return pageVC;
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
