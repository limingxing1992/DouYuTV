//
//  MoreViewController.m
//  DouYuTV
//
//  Created by qianfeng on 15/12/5.
//  Copyright © 2015年 李明星. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self customNavi];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)customNavi
{
    UIButton *leftbutton=[UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setImage: [UIImage imageNamed:@"btn_nav_back"] forState:UIControlStateNormal];
    leftbutton.frame=CGRectMake(0, 0, 25, 25);
    [leftbutton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithCustomView:leftbutton];
    self.navigationItem.titleView = nil;
    
    
}

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
