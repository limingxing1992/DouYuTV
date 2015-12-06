//
//  BaseViewController.m
//  DouYuTV
//
//  Created by qianfeng on 15/12/5.
//  Copyright © 2015年 李明星. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *leftbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setImage: [UIImage imageNamed:@"Image_scan"] forState:UIControlStateNormal];
    leftbutton.frame=CGRectMake(0, 0, 25, 25);
    [leftbutton addTarget:self action:@selector(SaoMiao) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    
    UIButton *rightbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    [rightbutton setImage: [UIImage imageNamed:@"btn_search"] forState:UIControlStateNormal];
    rightbutton.frame=CGRectMake(0, 0, 25, 25);
    [rightbutton addTarget:self action:@selector(Search) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:rightbutton];
    
    UIImageView *titleView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 104, 28)];
    titleView.image=[UIImage imageNamed:@"logo"];
    self.navigationItem.titleView=titleView;
    
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [self setHidesBottomBarWhenPushed:NO];
}


#pragma  makr --------------------二维码功能和搜索

-(void)SaoMiao
{
    NSLog(@"SaoMiao");
}

-(void)Search
{
    NSLog(@"Search");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
