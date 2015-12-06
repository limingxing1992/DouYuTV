//
//  ListModel.m
//  DouYuTV
//
//  Created by qianfeng on 15/12/4.
//  Copyright © 2015年 李明星. All rights reserved.
//

#import "ListModel.h"

@implementation ListModel

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.data = [(id)[NSMutableArray alloc] init];
    }
    
    return self;
}
@end
