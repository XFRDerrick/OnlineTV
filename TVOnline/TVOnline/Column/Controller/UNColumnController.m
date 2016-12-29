//
//  UNColumnController.m
//  TVOnline
//
//  Created by universe on 2016/12/27.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNColumnController.h"
#import "UNColumnViewFlowLayout.h"
#import "ColumnModel.h"
#import "UNColumnCell.h"

#import "OnlineModel.h"
#import "UNOnlineCell.h"
#import "UNOnlineViewFlowLayout.h"

#import <AVFoundation/AVFoundation.h>
#import "UNPlayingViewController.h"

#import "UNLoveViewCell.h"
#import "UNLoveViewFlowLayout.h"


@interface UNColumnController ()<UICollectionViewDelegate,UICollectionViewDataSource>

//初始化属性
@property (nonatomic, copy) NSString *requestPath;
@property (nonatomic, assign) UNCellType cellType;
@property (nonatomic, assign) UNFlowLayoutType flowLayoutType;
//


@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *columnDatas;

@end

@implementation UNColumnController

#pragma mark 初始化方法
- (instancetype)initWithCellType:(UNCellType)cellType flowLayoutType:(UNFlowLayoutType)flowLayoutType requestPath:(NSString *)path{
    
    if (self = [super init]) {
     
        _cellType = cellType;
        _flowLayoutType = flowLayoutType;
        _requestPath = path;
    }
    
    return self;
}

- (NSMutableArray *)columnDatas{

    if (!_columnDatas) {
        _columnDatas = [NSMutableArray array];
    }
    return _columnDatas;
}

- (UICollectionView *)collectionView{

    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = nil;
        
        if (self.flowLayoutType == UNCollectionFlowLayoutTypeColumn) {
             layout = [[UNColumnViewFlowLayout alloc] init];
        }
        if (self.flowLayoutType == UNCollectionFlowLayoutTypeOnline) {
            layout = [[UNOnlineViewFlowLayout alloc] init];
        }
        if (self.flowLayoutType == UNCollectionFlowLayoutTypeLove) {
            layout = [[UNLoveViewFlowLayout alloc] init];
        }
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self.view addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            if (([self.title isEqualToString:@"栏目"] || [self.title isEqualToString:@"直播"])) {
                make.edges.mas_equalTo(UIEdgeInsetsMake(64, 0, 0, 0));
            }else{
                make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
            }
            
        }];
        
        //单元格注册
        [_collectionView registerNib:[UINib nibWithNibName:@"UNColumnCell" bundle:nil] forCellWithReuseIdentifier:@"UNColumnCell"];
        [_collectionView registerNib:[UINib nibWithNibName:@"UNOnlineCell" bundle:nil] forCellWithReuseIdentifier:@"UNOnlineCell"];
        [_collectionView registerNib:[UINib nibWithNibName:@"UNLoveViewCell" bundle:nil] forCellWithReuseIdentifier:@"UNLoveViewCell"];
    }
    return _collectionView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setupUI];
    
}
- (void)setupUI{

    self.collectionView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        
        if (self.cellType == CollectionCellTypeColumn) {
            [self getColumnModels];
        }
        if (self.cellType == CollectionCellTypeOnline || self.cellType == CollectionCellTypeLove) {
            [self getOnlineModels];
        }
        
    }];
    
    [self.collectionView.mj_header beginRefreshing];
}

- (void)getOnlineModels{

    [NetWorkTools getOnlineModelWithPath:self.requestPath completionHandler:^(OnlineModel *model, NSError *error) {
        [self.collectionView.mj_header endRefreshing];
        if (!error) {
            [self.columnDatas removeAllObjects];
            [self.columnDatas addObjectsFromArray:model.data];
            [self.collectionView reloadData];
        }else{
            NSLog(@"请求数据失败");
        }

    }];
    
}
- (void)getColumnModels{
    [NetWorkTools getColoumnModelWithPath:self.requestPath completionHandler:^(NSArray<ColumnModel *> *models, NSError *error) {
        [self.collectionView.mj_header endRefreshing];
        if (!error) {
            [self.columnDatas removeAllObjects];
            [self.columnDatas addObjectsFromArray:models];
            [self.collectionView reloadData];
            
        }else{
            NSLog(@"请求数据失败");
        }
    }];
    
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.columnDatas.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.cellType == CollectionCellTypeColumn) {
        UNColumnCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"UNColumnCell" forIndexPath:indexPath];
        
        cell.model = self.columnDatas[indexPath.row];
        
        return cell;
    }
    if (self.cellType == CollectionCellTypeOnline) {
        UNOnlineCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"UNOnlineCell" forIndexPath:indexPath];
        
        cell.model = self.columnDatas[indexPath.row];
        
        return cell;
        
    }
    
    if (self.cellType == CollectionCellTypeLove) {
        UNLoveViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"UNLoveViewCell" forIndexPath:indexPath];
        cell.model = self.columnDatas[indexPath.row];
        return cell;
    }
    return nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    //栏目
    if (self.cellType == CollectionCellTypeColumn) {
       
        ColumnModel *model = self.columnDatas[indexPath.row];
        NSString *requestPath = [NSString stringWithFormat:@"http://www.quanmin.tv/json/categories/%@/list.json",model.slug];
        UNColumnController *onlineVC = [[UNColumnController alloc] initWithCellType:CollectionCellTypeOnline flowLayoutType:UNCollectionFlowLayoutTypeOnline requestPath:requestPath];
        onlineVC.title = model.name;
        [self.navigationController pushViewController:onlineVC animated:YES];
        
    }
    
    if (self.cellType == CollectionCellTypeOnline) {
        
        UNPlayingViewController *playVC = [[UNPlayingViewController alloc] init];
        playVC.model = self.columnDatas[indexPath.row];
        [self.navigationController pushViewController:playVC animated:YES];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    //push出得控制器
    NSArray *arr =[self.navigationController viewControllers];
    UIViewController *upVC = arr[0];
    if ([upVC.title isEqualToString:@"栏目"] && arr.count > 1) {
         self.tabBarController.tabBar.hidden = YES;
    }
}

- (void)viewWillDisappear:(BOOL)animated{
    //push出得控制器
    self.tabBarController.tabBar.hidden = NO;

//    if (!([self.title isEqualToString:@"栏目"] || [self.title isEqualToString:@"直播"] || [self.title isEqualToString:@"首页"])) {
//        self.tabBarController.tabBar.hidden = NO;
//    }

    
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
