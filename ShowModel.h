//
//  ItemModel.h
//  DouYuTV
//
//  Created by qianfeng on 15/12/4.
//  Copyright © 2015年 李明星. All rights reserved.
//

#import "JSONModel.h"


@protocol ItemModel <NSObject>


@end

@interface ItemModel : JSONModel

@property (nonatomic, copy) NSString<Optional> *id;

@property (nonatomic, copy) NSString<Optional> *push_ios;

@property (nonatomic, copy) NSString<Optional> *push_android;

@property (nonatomic, copy) NSString<Optional> *mobile_switch;

@property (nonatomic, copy) NSString<Optional> *url;

@property (nonatomic, copy) NSString<Optional> *name;

@property (nonatomic, copy) NSString<Optional> *status;

@property (nonatomic, copy) NSString<Optional> *sort;

@property (nonatomic, copy) NSString<Optional> *ctime;

@property (nonatomic, copy) NSString<Optional> *admin;

@property (nonatomic, copy) NSString<Optional> *related_id;


@end


@interface DataModel : JSONModel

@property (nonatomic, strong)NSMutableArray<ItemModel> *result;

@end


@interface ShowModel : JSONModel

@property (nonatomic ,strong)DataModel *data;


@end
