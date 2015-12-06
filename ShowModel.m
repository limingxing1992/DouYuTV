//
//  ItemModel.m
//  DouYuTV
//
//  Created by qianfeng on 15/12/4.
//  Copyright © 2015年 李明星. All rights reserved.
//

#import "ShowModel.h"


@implementation ItemModel

@synthesize id = _id;

@end


@implementation DataModel

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.result = [(id)[NSMutableArray alloc] init];
    }
    
    return self;
}

@end


@implementation ShowModel


@end