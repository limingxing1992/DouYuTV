//
//  MainModel.h
//  DouYuTV
//
//  Created by qianfeng on 15/12/4.
//  Copyright © 2015年 李明星. All rights reserved.
//

#import "JSONModel.h"

#import "TVModel.h"


@protocol RoomModel <NSObject>



@end

@interface RoomModel : JSONModel

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *cate_id;

@property (nonatomic ,strong) NSMutableArray<TVModel> *roomlist;

@end



@interface MainModel : JSONModel

@property (nonatomic, strong) NSMutableArray<RoomModel> *data;


@end



