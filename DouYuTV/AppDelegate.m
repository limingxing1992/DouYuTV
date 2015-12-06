//
//  AppDelegate.m
//  DouYuTV
//
//  Created by qianfeng on 15/12/4.
//  Copyright © 2015年 李明星. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)setUI
{
    NSMutableArray *childVCArray = [[NSMutableArray alloc] initWithCapacity:4];
    //首页
    MainViewController *mainVC = [[MainViewController alloc] init];
    [mainVC.tabBarItem setTitle:@"首页"];
    [mainVC.tabBarItem setImage:[UIImage imageNamed:@"btn_home_normal"]];
    [mainVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"btn_home_selected"]];
    BaseNavigationViewController *mainNVC = [[BaseNavigationViewController alloc] initWithRootViewController:mainVC];
    [childVCArray addObject:mainNVC];
    
    //栏目
    ColumnViewController *ColumnVC = [[ColumnViewController alloc] init];
    [ColumnVC.tabBarItem setTitle:@"栏目"];
    [ColumnVC.tabBarItem setImage:[UIImage imageNamed:@"btn_column_normal"]];
    [ColumnVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"btn_column_selected"]];
    BaseNavigationViewController *ColumnNavC = [[BaseNavigationViewController alloc] initWithRootViewController:ColumnVC];
    [childVCArray addObject:ColumnNavC];
    
    //直播
    LiveViewController *LiveVC = [[LiveViewController alloc] init];
    [LiveVC.tabBarItem setTitle:@"直播"];
    [LiveVC.tabBarItem setImage:[UIImage imageNamed:@"btn_live_normal"]];
    [LiveVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"btn_live_selected"]];
    BaseNavigationViewController *OnlineNavC = [[BaseNavigationViewController alloc] initWithRootViewController:LiveVC];
    [childVCArray addObject:OnlineNavC];
    
    
    //我的
    UserViewController *userVC = [[UserViewController alloc] init];
    [userVC.tabBarItem setTitle:@"我的"];
    [userVC.tabBarItem setImage:[UIImage imageNamed:@"btn_user_normal"]];
    [userVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"btn_user_selected"]];
    BaseNavigationViewController *MineNavC = [[BaseNavigationViewController alloc] initWithRootViewController:userVC];
    [childVCArray addObject:MineNavC];
    
    
    
    //tabbar
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor darkGrayColor],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    UITabBarController *tvc = [[UITabBarController alloc] init];
    [tvc  setViewControllers:childVCArray];
    UIView *backView=[[UIView alloc]initWithFrame:tvc.view.frame];
    backView.backgroundColor=[UIColor whiteColor];
    [tvc.tabBar insertSubview:backView atIndex:0];
    tvc.tabBar.opaque=YES;
    tvc.tabBar.tintColor=TabBar_T_Color;
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = tvc;
    [self.window makeKeyAndVisible];


    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [self setUI];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
