//
//  Networking.h
//  DouYuTV
//
//  Created by qianfeng on 15/12/4.
//  Copyright © 2015年 李明星. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^block)(NSDictionary *dict);


@interface Networking : NSObject

+ (instancetype)defaultNetwork;

//首页滚动视图请求
- (void)scrollrequsetSuccess:(block)success
                     failure:(block)failure;

//首页秀视图请求
- (void)showRequestSuccess:(block)success
                   failure:(block)failure;

//首页表示图请求
- (void)mainRequestSuccess:(block)success
                   failure:(block)failure;
//栏目视图请求
- (void)columnRequestSuccess:(block)success
                     failure:(block)failure;

//直播视图请求
- (void)tvRequestWithOffset:(NSInteger)offset
                    success:(block)success
                    failure:(block)failure;

//更多专区
- (void)moreRequestWithId:(NSString *)Id
                   offset:(NSInteger)offset
                  success:(block)success
                  failure:(block)failure;


@end
