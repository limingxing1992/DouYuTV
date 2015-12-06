//
//  URL.h
//  DouYuTV
//
//  Created by qianfeng on 15/12/4.
//  Copyright © 2015年 李明星. All rights reserved.
//

#ifndef URL_h
#define URL_h



//首页界面接口

//滚动视图
#define kScrollUrl @"http://www.douyutv.com/api/v1/slide/6?aid=android&client_sys=ios"

//推荐秀
#define kShowUrl @"http://www.douyutv.com/api/v1/getCyclePicture?aid=android&client_sys=ios"

//主要内容
#define kMainUrl @"http://www.douyutv.com/api/v1/channel?aid=android&client_sys=ios"


//栏目界面接口
#define kColumnUrl @"http://www.douyutv.com/api/v1/game?aid=android&client_sys=ios"

//直播界面(传入参数下拉加载)
#define kTVUrl @"http://www.douyutv.com/api/v1/live?aid=android&client_sys=ios&limit=20&offset=%ld"

//更多专区
#define kMoreUrl @"http://www.douyutv.com/api/v1/live/%@?aid=android&client_sys=android&limit=20&offset=%ld"

//推荐点击（tag_id分界面类型）
#define kRoomUrl @"http://www.douyutv.com/api/v1/getTagRoomList?aid=android&client_sys=andorid&tag_id=%@&limit=20&offset=%ld"



#endif /* URL_h */
