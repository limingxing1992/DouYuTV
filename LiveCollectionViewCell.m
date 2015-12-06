
//
//  LiveCollectionViewCell.m
//  DouYuTV
//
//  Created by qianfeng on 15/12/5.
//  Copyright © 2015年 李明星. All rights reserved.
//

#import "LiveCollectionViewCell.h"


@interface LiveCollectionViewCell ()
{
    UIImageView *_imageView;
    UILabel *_titleLable;
    
    UILabel *_nameLable;
    UILabel *_numberLable;
    
}
@end

@implementation LiveCollectionViewCell
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
        
        //布局名字和观众数
        CGFloat width = _imageView.frame.size.width;
        CGFloat height = _imageView.frame.size.height;

        
        //贴背景图
        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, height * 5 / 6, width, height / 6)];
        backView.backgroundColor = [UIColor blackColor];
        backView.alpha = 0.6;
        [_imageView addSubview:backView];
        
        
        
        //布局直播者名字
        _nameLable = [[UILabel alloc] initWithFrame:CGRectMake(0,0, width * 2/ 3, height  / 6)];
        _nameLable.font = [UIFont systemFontOfSize:10];
//        _nameLable.adjustsFontSizeToFitWidth = YES;
        _nameLable.textColor = [UIColor whiteColor];
        [backView addSubview:_nameLable];
        
        //布局观众图片
        UIImageView *numIv = [[UIImageView alloc] initWithFrame:CGRectMake(width * 2 / 3,
                                                                           0,
                                                                           15,
                                                                           height / 6)];
        [numIv setImage:LOADIOACLIMAGE(@"Image_online")];
        [backView addSubview:numIv];
        
        
        //布局观众数
        _numberLable = [[UILabel alloc] initWithFrame:CGRectMake(width * 2 / 3 + 15,
                                                                 0,
                                                                 width / 3 -15,
                                                                 height / 6)];
        _numberLable.font = [UIFont systemFontOfSize:10];
        _numberLable.adjustsFontSizeToFitWidth = YES;
        _numberLable.backgroundColor = [UIColor blackColor];
        _numberLable.alpha = 1;
        _numberLable.textColor = [UIColor whiteColor];
        [backView addSubview:_numberLable];
        
        
    }
    
    if (!_titleLable) {
        _titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                frame.size.height * 5 / 6,
                                                                frame.size.width,
                                                                frame.size.height / 6)];
        _titleLable.font = [UIFont systemFontOfSize:15];
        [self addSubview:_titleLable];
    }
}

- (void)updateUIWithLive:(TVModel *)model
{
    if (model) {
        [_imageView sd_setImageWithURL:[NSURL URLWithString:model.room_src] placeholderImage:LOADIOACLIMAGE(@"Img_default")];
        
        _titleLable.text = model.room_name;
        
        _numberLable.text = [NSString stringWithFormat:@"%0.1f万",[model.online doubleValue]/10000];
        
        _nameLable.text = model.nickname;
        
    }
    return;
}

@end
