//
//  SectionHeadView.h
//  DouYuTV
//
//  Created by qianfeng on 15/12/5.
//  Copyright © 2015年 李明星. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SectionHeadDelegate <NSObject>

- (void)onMore:(NSString *)Id title:(NSString *)title;

@end

@interface SectionHeadView : UIView

@property (strong, nonatomic) IBOutlet UILabel *titleLable;

@property (copy, nonatomic) NSString *Id;

@property (assign, nonatomic) id<SectionHeadDelegate> delegate;


@end
