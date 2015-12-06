//
//  NewShowTableViewCell.m
//  DouYuTV
//
//  Created by qianfeng on 15/12/5.
//  Copyright © 2015年 李明星. All rights reserved.
//

#import "NewShowTableViewCell.h"
#import "NewShow.h"

@interface NewShowTableViewCell ()
{
    UIScrollView *_scrollView;
    NSArray *_arry;
}
@end

@implementation NewShowTableViewCell

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
        [self initScrollView];
    }
    
    return self;
}


- (void)initScrollView
{

    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 110)];
    _scrollView.userInteractionEnabled=YES;
    _scrollView.directionalLockEnabled=YES;
    _scrollView.pagingEnabled=NO;
    _scrollView.bounces=NO;
    _scrollView.showsHorizontalScrollIndicator=NO;
    _scrollView.showsVerticalScrollIndicator=NO;
    _scrollView.backgroundColor = RGB(226, 226, 226);
    [self addSubview:_scrollView];
    
    UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(0, 144, SCREEN_WIDTH, 1)];
    lineView.backgroundColor=RGBA(230, 230, 230, 1.0);
    [self addSubview:lineView];
}

- (void)updateWith:(NSArray *)arry
{
    //保存数组
    _arry = [NSArray arrayWithArray:arry];
    
    _scrollView.contentSize = CGSizeMake(125 * arry.count+5, 105);
    
    
    for (NSInteger i = 0; i <arry.count; i++) {
        
        ItemModel *model = arry[i];
        CGRect frame=CGRectMake((i+1)*5+i*120, 5, 120, 100);
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NewShow" owner:self options:nil];
        
        NewShow *showView = [nib objectAtIndex:0];
        
        showView.frame = frame;
        showView.tag = i;
        [showView updateWith:model];
        [_scrollView addSubview:showView];
        //添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touch:)];
        [showView addGestureRecognizer:tap];
    }

}

- (void)touch:(UITapGestureRecognizer *)tap
{
    UIView *view = tap.view;
    NSInteger flag = view.tag;
    
    ItemModel *model = _arry[flag];
    if (_block) {
        _block(model.id,model.name);
    }
}

@end
