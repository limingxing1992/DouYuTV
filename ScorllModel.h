//
//  ScorllModel.h
//  DouYuTV
//
//  Created by qianfeng on 15/12/4.
//  Copyright © 2015年 李明星. All rights reserved.
//

#import "JSONModel.h"

#import "TVModel.h"


@protocol ScorllItemModel <NSObject>



@end

@interface ScorllItemModel : JSONModel

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *pic_url;

@property (nonatomic, strong) TVModel *room;

@end


@interface ScorllModel : JSONModel

@property (nonatomic, strong)NSMutableArray<ScorllItemModel> *data;


@end



