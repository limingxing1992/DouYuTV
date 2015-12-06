//
//  ColumnModel.h
//  DouYuTV
//
//  Created by qianfeng on 15/12/4.
//  Copyright © 2015年 李明星. All rights reserved.
//
/*
 "cate_id":"1",
 "game_name":"英雄联盟",
 "short_name":"LOL",
 "game_url":"/directory/game/LOL",
 "game_src":"http://staticlive.douyutv.com/upload/game_cate/c543faae97189c529c37b7741906d5a1.jpg",
 "game_icon":"http://staticlive.douyutv.com/upload/game_cate/03f34b23c3b92aebddc99fb1a307a4df.jpg",
 "online_room":"1245",
 "online_room_ios":"104"
 */

#import "JSONModel.h"


@protocol MyItemModel <NSObject>


@end

@interface MyItemModel : JSONModel

@property (nonatomic, copy) NSString *cate_id;

@property (nonatomic, copy) NSString *game_name;

@property (nonatomic, copy) NSString *short_name;

@property (nonatomic, copy) NSString *game_url;

@property (nonatomic, copy) NSString *game_icon;

@property (nonatomic, copy) NSString *online_room;

@property (nonatomic, copy) NSString *online_room_ios;

@end

@interface ColumnModel : JSONModel

@property (nonatomic, copy) NSString *error;

@property (nonatomic ,strong) NSArray<Optional,MyItemModel> *data;



@end


