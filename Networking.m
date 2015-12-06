//
//  Networking.m
//  DouYuTV
//
//  Created by qianfeng on 15/12/4.
//  Copyright © 2015年 李明星. All rights reserved.
//

#import "Networking.h"
#import <AFNetworking/AFNetworking.h>


@implementation Networking

+ (instancetype)defaultNetwork
{
    static Networking *netWork = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netWork = [[Networking alloc] init];
    });
    
    return netWork;
}

- (AFHTTPRequestOperationManager *)myManager
{
    AFHTTPRequestOperationManager  *manager = [AFHTTPRequestOperationManager manager];

    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    return manager;
}

#pragma mark ----------------------------------网络请求
//首页滚动视图的请求
- (void)scrollrequsetSuccess:(block)success
                     failure:(block)failure
{
    AFHTTPRequestOperationManager *manager = [self myManager];
    
    [manager POST:kScrollUrl parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        success(dict);
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {

        failure(nil);
    }];
}

- (void)showRequestSuccess:(block)success failure:(block)failure
{
    AFHTTPRequestOperationManager *manager = [self myManager];

    [manager POST:kShowUrl parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];

        success(dict);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        failure(nil);
    }];
}

- (void)mainRequestSuccess:(block)success failure:(block)failure
{
    AFHTTPRequestOperationManager *manager = [self myManager];
    
    [manager POST:kMainUrl parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];

        success(dict);
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
    }];

}

- (void)columnRequestSuccess:(block)success failure:(block)failure
{
    AFHTTPRequestOperationManager *manager = [self myManager];
    
    [manager POST:kColumnUrl parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        
        success(dict);
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        failure(nil);
        
    }];

}

- (void)tvRequestWithOffset:(NSInteger)offset success:(block)success failure:(block)failure
{
    AFHTTPRequestOperationManager *manager = [self myManager];
    NSString *url = [NSString stringWithFormat:kTVUrl,(long)offset];
    [manager POST:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
       
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];

        success(dict);
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        failure(nil);
    }];
}

- (void)moreRequestWithId:(NSString *)Id offset:(NSInteger)offset success:(block)success failure:(block)failure
{
    AFHTTPRequestOperationManager *manager = [self myManager];
    //此处判断id是数字类型还是字符类型
    BOOL Yet = [Id stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]].length > 0;
    NSString *url = nil;
    if (Yet) {
       url = [NSString stringWithFormat:kMoreUrl,Id,offset];
    }else{
        url = [NSString stringWithFormat:kRoomUrl,Id,offset];
    }
    
    [manager POST:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        success(dict);
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
    }];
}
@end
