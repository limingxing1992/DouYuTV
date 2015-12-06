//
//  MainModel.m
//  DouYuTV
//
//  Created by qianfeng on 15/12/4.
//  Copyright © 2015年 李明星. All rights reserved.
//

#import "MainModel.h"



@implementation RoomModel

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.roomlist = [(id)[NSMutableArray alloc] init];
    }
    
    return self;
}

@end


@implementation MainModel

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.data = [(id)[NSMutableArray alloc] init];
    }
    
    return self;
}

@end


