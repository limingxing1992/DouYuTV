//
//  NewShowTableViewCell.h
//  DouYuTV
//
//  Created by qianfeng on 15/12/5.
//  Copyright © 2015年 李明星. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^showBlock)(NSString *Id,NSString *name);


@interface NewShowTableViewCell : UITableViewCell

@property (nonatomic, copy) showBlock block;

- (void)updateWith:(NSArray *)arry;

@end
