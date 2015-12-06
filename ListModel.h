//
//  ListModel.h
//  DouYuTV
//
//  Created by qianfeng on 15/12/4.
//  Copyright © 2015年 李明星. All rights reserved.
//

#import "JSONModel.h"

#import "TVModel.h"

@interface ListModel : JSONModel

@property (nonatomic, copy) NSString *error;

@property (nonatomic, strong) NSMutableArray<TVModel> *data;

@end
