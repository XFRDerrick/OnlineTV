//
//  UNRecommendController.m
//  TVOnline
//
//  Created by universe on 2016/12/28.
//  Copyright © 2016年 universe. All rights reserved.
//

#import "UNRecommendController.h"
#import "UNOnlineCell.h"
#import "OnlineModel.h"
#import "UNLoveViewCell.h"

#import "UNRecommendHeaderView.h"

#import "recommendADCell.h"

@interface UNRecommendController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource,iCarouselDelegate,iCarouselDataSource>

@property (nonatomic, strong) NSArray *ads;
@property (nonatomic, strong) iCarousel *ic;
@property (nonatomic, strong) UIPageControl *pageControll;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation UNRecommendController

- (NSArray *)ads{

    if (!_ads) {
        _ads = [NSArray array];
    }
    return _ads;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    http://www.quanmin.tv/json/page/app-data/info.json
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
        [NetWorkTools getAppDataModelWithPath:KAppDataPath completionHandler:^(AppDataModel *model, NSError *error) {
            if (!error) {
                self.ads = model.app_focus;
                NSLog(@"ads:%ld",self.ads.count);
                [self.ic reloadData];
                //获取数据之后
                NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(changeADPage) userInfo:nil repeats:YES];
                self.timer = timer;
                self.pageControll.numberOfPages = self.ads.count;
                //刷新轮播
//                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//                [self.collectionView reloadItemsAtIndexPaths:indexPath];
            }
        }];
    });
    
    [self setupUI];
}

- (void)setupUI{
    self.collectionView.backgroundColor = [UIColor whiteColor];
    //    self.view.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[recommendADCell class] forCellWithReuseIdentifier:@"recommendADCell"];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"UNOnlineCell" bundle:nil] forCellWithReuseIdentifier:@"UNOnlineCell"];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"UNLoveViewCell" bundle:nil] forCellWithReuseIdentifier:@"UNLoveViewCell"];
    // Do any additional setup after loading the view.
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"UNRecommendHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UNRecommendHeaderView"];
    //foot
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UIView"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 11;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    
    return self.datas[section-1].list.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        recommendADCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"recommendADCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor brownColor];
        cell.ic.delegate = self;
        cell.ic.dataSource = self;
        self.ic = cell.ic;
        //在数据加载后设置PageControl的numberoffPage
        self.pageControll = cell.pageControl;
        return cell;
        
    }
    
    
    RecommendRoomModel *reModel = self.datas[indexPath.section - 1];
    RecommendRoomListModel *list = reModel.list[indexPath.row];
    
    if (indexPath.section == 2) {
        
        UNLoveViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UNLoveViewCell" forIndexPath:indexPath];
        
        cell.listModel = list;
        return cell;
    }
    UNOnlineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UNOnlineCell" forIndexPath:indexPath];
    cell.listModel = list;
    
    return cell;
}




#pragma mark <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat w = 0;
    CGFloat h = 0;
    
    if (indexPath.section == 0) {
        w = kScreenSize.width;
        h = w * 0.45;
        
    }else if (indexPath.section == 2) {
        w = (long)((kScreenSize.width - 10 * 3)/ 2);
        h = w;
        
    }else{
        w = (long)((kScreenSize.width - 10 * 3)/ 2);
        h = w * 3 / 5.0 + 40;
    }
    CGSize itemSize = CGSizeMake(w, h);
    return itemSize;
    
}
#pragma mark foot size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{

    if (section == 0||section == 10) {
        return CGSizeZero;
    }else{
        return CGSizeMake(0, 15);
    }
    
}

#pragma mark headerView设置
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if (kind == UICollectionElementKindSectionFooter) {
        
        if (indexPath.section == 0 || indexPath.section == 10) {
            return nil;
        }else{
        
            UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UIView" forIndexPath:indexPath];
            
            view.backgroundColor = KRGB_Color(190, 251, 255, 1);
            return view;
        }
        
    }else{
        if (indexPath.section == 0) {
            return nil;
        }else{
           UNRecommendHeaderView  *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UNRecommendHeaderView" forIndexPath:indexPath];
            
            RecommendRoomModel *model = self.datas[indexPath.section - 1];
            view.titleLable.text = model.name;
            return view;
        }
    }
}
#pragma mark header大小设置
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section != 0) {
        return CGSizeMake(0, 30);
    }
    return CGSizeZero;
}

#pragma mark ic设置
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    
    return self.ads.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view{
    //查看是否获取到了view nil 自己创建
    if (!view) {
        view = [[UIView alloc] initWithFrame:carousel.bounds];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:carousel.bounds];
        [view addSubview:imageView];
        
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.font = [UIFont systemFontOfSize:12];
        titleLable.textColor = [UIColor lightGrayColor];
        titleLable.textAlignment = NSTextAlignmentLeft;
        [view addSubview:titleLable];
        [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view).offset(20);
            make.bottom.equalTo(view).offset(-5);
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(kScreenSize.width * 0.6);
        }];
        titleLable.tag = 220;
        
        imageView.tag = 210;//标记 赋值
    }
    //给数据
    UIImageView *imageView = (UIImageView *)[view viewWithTag:210];

    HomeBaseModel *model = self.ads[index];
    [imageView setImageWithURL:[NSURL URLWithString:model.thumb] placeholder:[UIImage imageNamed:@"scream0"]];
    UILabel *titleLable =(UILabel *)[view viewWithTag:220];
    titleLable.text = model.title;
    return view;
}

//捆绑PageControll
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    self.pageControll.currentPage = carousel.currentItemIndex;
}

//设置连续滚动模式
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    //根据Option的值确定 设置返回的Value 确定样式
    if (option == iCarouselOptionWrap) {
        value = YES ;
    }
    return value;
}
#pragma mark 定时器执行任务
- (void)changeADPage{
    [self.ic scrollToItemAtIndex:self.ic.currentItemIndex + 1 animated:YES];
    
}





@end
