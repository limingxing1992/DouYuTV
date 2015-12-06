//
//  NewShow.m
//  DouYuTV
//
//  Created by qianfeng on 15/12/5.
//  Copyright © 2015年 李明星. All rights reserved.
//

#import "NewShow.h"

@interface NewShow ()
@property (strong, nonatomic) IBOutlet UIImageView *showIMG;

@property (strong, nonatomic) IBOutlet UILabel *titleLable;
@end

@implementation NewShow

- (void)updateWith:(ItemModel *)model
{
    
    
    [self.showIMG sd_setImageWithURL:[NSURL URLWithString:model.url] placeholderImage:LOADIOACLIMAGE(@"bo")];
    
    self.titleLable.font = FONT(15);
    self.titleLable.text = model.name;
}

@end
