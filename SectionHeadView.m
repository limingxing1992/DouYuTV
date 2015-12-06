//
//  SectionHeadView.m
//  DouYuTV
//
//  Created by qianfeng on 15/12/5.
//  Copyright © 2015年 李明星. All rights reserved.
//

#import "SectionHeadView.h"



@implementation SectionHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)onMore:(id)sender {
    
    if (self.delegate && self.Id) {
        [self.delegate onMore:self.Id title:self.titleLable.text];
    }
}

@end
