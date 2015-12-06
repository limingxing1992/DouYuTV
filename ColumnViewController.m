//
//  ColumnViewController.m
//  DouYuTV
//
//  Created by qianfeng on 15/12/5.
//  Copyright © 2015年 李明星. All rights reserved.
//

#import "ColumnViewController.h"
#import "ColumnCollectionViewCell.h"
@interface ColumnViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionView *_collectionView;
}
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UIActivityIndicatorView *aciview;

@end

@implementation ColumnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置集合视图
    [self initCollectionView];
    
    //获取数据源
    _dataSource = [[NSMutableArray alloc] init];
    [self loadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark--------------定制集合视图

-(void)initCollectionView
{
    UICollectionViewFlowLayout *laout = [[UICollectionViewFlowLayout alloc] init];
    laout.itemSize = CGSizeMake((SCREEN_WIDTH-20)/3, SCREEN_HEIGHT/3);
    laout.minimumInteritemSpacing = 5;
    laout.minimumLineSpacing = 5;
    laout.scrollDirection = UICollectionViewScrollDirectionVertical;
    laout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:laout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = RGB(226, 226, 226);
    
    [_collectionView registerClass:[ColumnCollectionViewCell class] forCellWithReuseIdentifier:@"column"];
    
    [self.view addSubview:_collectionView];
    
    self.aciview = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 110, 110)];
    self.aciview.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    self.aciview.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
    self.aciview.color = [UIColor blackColor];
    [_collectionView addSubview:self.aciview];
    
    [self.aciview startAnimating];

}


#pragma mark ------------------获取数据源

- (void)loadData
{
    
    __block NSMutableArray *data = _dataSource;
    
    __weak typeof(_collectionView)weakCV = _collectionView;
    
    typeof(self)weakSelf = self;
    
    [[Networking defaultNetwork] columnRequestSuccess:^(NSDictionary *dict) {
        
        ColumnModel *model  =[[ColumnModel alloc] initWithDictionary:dict error:nil];
        
        for (id obj in model.data) {
            [data addObject:obj];
        }
        [weakSelf.aciview stopAnimating];
        //刷新视图
        [weakCV reloadData];
        
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
    ColumnCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"column" forIndexPath:indexPath];
    
    [cell updateUIWithColumn:_dataSource[indexPath.row]];
    
    return cell;
}
@end
