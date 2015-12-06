//
//  LiveViewController.m
//  DouYuTV
//
//  Created by qianfeng on 15/12/5.
//  Copyright © 2015年 李明星. All rights reserved.
//

#import "LiveViewController.h"
#import "LiveCollectionViewCell.h"

@interface LiveViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionView *_collectionView;
}


@property (nonatomic, assign) NSInteger offset;

@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, assign) BOOL isLoading;

@property (nonatomic, assign) BOOL isRefreshing;

@property (nonatomic, strong) UIActivityIndicatorView *aciview;

@end

@implementation LiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置集合视图
    [self initCollectionView];
    
    //获取数据源
    _dataSource = [[NSMutableArray alloc] init];
    [self loadData];
    
    //添加下拉刷新
    self.offset = 0;
    [self addRefresh];
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark -----------------上拉加载和下拉刷新

- (void)addRefresh
{
    __weak typeof(self)weak = self;
    
    _collectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        if (weak.isLoading) {
            return ;
        }
        weak.isLoading = YES;
        weak.offset += 20;
        
        [weak loadData];
        
    }];
    
    _collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        if (weak.isRefreshing) {
            return ;
        }
        
        weak.isRefreshing = YES;
        weak.offset = 0;
        [weak loadData];
    }];

}

- (void)endRefresh
{
    if (self.isLoading) {
        self.isLoading = NO;
        [_collectionView.footer endRefreshing];
    }
    
    if (self.isRefreshing) {
        self.isRefreshing = NO;
        [_collectionView.header endRefreshing];
    }
}

#pragma mark--------------定制集合视图

-(void)initCollectionView
{
    UICollectionViewFlowLayout *laout = [[UICollectionViewFlowLayout alloc] init];
    laout.itemSize = CGSizeMake((SCREEN_WIDTH-15)/2, SCREEN_HEIGHT/5);
    laout.minimumInteritemSpacing = 5;
    laout.minimumLineSpacing = 5;
    laout.scrollDirection = UICollectionViewScrollDirectionVertical;
    laout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:laout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = RGB(226, 226, 226);
    
    [_collectionView registerClass:[LiveCollectionViewCell class] forCellWithReuseIdentifier:@"live"];
    
    [self.view addSubview:_collectionView];

    //菊花
    self.aciview = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    self.aciview.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
    self.aciview.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    self.aciview.color = [UIColor blackColor];
    [_collectionView addSubview:self.aciview];
    
    [self.aciview startAnimating];
}


#pragma mark ------------------获取数据源

- (void)loadData
{
    
    __block NSMutableArray *data = _dataSource;
    
    __weak typeof(_collectionView)weakCV = _collectionView;
    
    __weak typeof(self)weakself = self;
    
    if (self.Id) {
        //更多专区处理
        
        [[Networking defaultNetwork] moreRequestWithId:self.Id offset:self.offset success:^(NSDictionary *dict) {

            ListModel *model = [[ListModel alloc] initWithDictionary:dict error:nil];
            
            if (weakself.isRefreshing) {
                [data removeAllObjects];
            }
            
            for (id obj in model.data) {
                [data addObject:obj];
            }
            
            [weakself.aciview stopAnimating];
            [weakCV reloadData];
            
            [weakself endRefresh];
            
        } failure:^(NSDictionary *dict) {
            
        }];
        
        return;
    }
    

    
    
    [[Networking defaultNetwork] tvRequestWithOffset:self.offset success:^(NSDictionary *dict) {
        
        ListModel *model = [[ListModel alloc] initWithDictionary:dict error:nil];
        
        if (weakself.isRefreshing) {
            [data removeAllObjects];
        }
        
        for (id obj in model.data) {
            [data addObject:obj];
        }
        
        [weakself.aciview stopAnimating];
        [weakCV reloadData];
        
        [weakself endRefresh];
        
    } failure:^(NSDictionary *dict) {
        
    }];

}

#pragma mark ------------------集合视图代理

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"%ld",_dataSource.count);
    return _dataSource.count;

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LiveCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"live" forIndexPath:indexPath];
    
    [cell updateUIWithLive:_dataSource[indexPath.row]];
    
    return cell;
}

@end
