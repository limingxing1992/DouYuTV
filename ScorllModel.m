//
//  ScorllModel.m
//  DouYuTV
//
//  Created by qianfeng on 15/12/4.
//  Copyright © 2015年 李明星. All rights reserved.
//

#import "ScorllModel.h"


@implementation ScorllItemModel

@synthesize id = _id;


@end


@implementation ScorllModel

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.data = (id)[[NSMutableArray alloc] init];
    }
    
    return self;
}


@end


