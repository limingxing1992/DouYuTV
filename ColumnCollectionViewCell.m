//
//  ColumnCollectionViewCell.m
//  DouYuTV
//
//  Created by qianfeng on 15/12/5.
//  Copyright © 2015年 李明星. All rights reserved.
//

#import "ColumnCollectionViewCell.h"


@interface ColumnCollectionViewCell ()
{
    UIImageView *_imageView;
    UILabel *_titleLable;
    
}
@end

@implementation ColumnCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self customUI];
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

- (void)customUI
{
    CGRect frame = self.frame;
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                   0,
                                                                   frame.size.width,
                                                                   frame.size.height*5/6)];
        [self addSubview:_imageView];
    }
    
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                frame.size.height * 5 / 6,
                                                                frame.size.width,
                                                                frame.size.height / 6)];
        _titleLable.font = FONT(20);
        _titleLable.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_titleLable];
    }
}

- (void)updateUIWithColumn:(MyItemModel *)model
{
    if (model) {
        
        UIImage *placeImage = LOADIOACLIMAGE(@"Image_no_data");
        
        [_imageView sd_setImageWithURL:[NSURL URLWithString:model.game_icon] placeholderImage:placeImage];
        
        _titleLable.text = model.game_name;
    }
    return ;
}

@end
