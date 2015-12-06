//
//  MainTableViewCell.m
//  DouYuTV
//
//  Created by qianfeng on 15/12/5.
//  Copyright © 2015年 李明星. All rights reserved.
//

#import "MainTableViewCell.h"
#import "LiveCollectionViewCell.h"
@interface MainTableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionView *_collectionView;
    NSMutableArray *_dataSource;
}

@end

@implementation MainTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _dataSource = [[NSMutableArray alloc] init];
        [self initCollectionView];
    }
    
    return self;
}

- (void)initCollectionView
{
    CGFloat width = SCREEN_WIDTH;
    CGFloat height = 280 *KWidth_Scale;
    
    UICollectionViewFlowLayout *laout = [[UICollectionViewFlowLayout alloc] init];
    laout.itemSize = CGSizeMake((width-15)/2, (height-15)/2);
    laout.minimumInteritemSpacing = 5;
    laout.minimumLineSpacing = 5;
    laout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, width, height) collectionViewLayout:laout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = RGB(226, 226, 226);
    _collectionView.scrollEnabled = NO;
    
    [_collectionView registerClass:[LiveCollectionViewCell class] forCellWithReuseIdentifier:@"main"];
    
    [self addSubview:_collectionView];

}

#pragma mark -----------代理

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LiveCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"main" forIndexPath:indexPath];
    
    [cell updateUIWithLive:_dataSource[indexPath.row]];
    
    return cell;
}


#pragma mark ----------------------数据更新


- (void)updateWith:(RoomModel *)model
{
    [_dataSource addObjectsFromArray:model.roomlist];
    [_collectionView reloadData];
}
@end
