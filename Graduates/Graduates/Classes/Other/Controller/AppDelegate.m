//
//  AppDelegate.m
//  Graduates
//
//  Created by 谢朝森 on 16/3/28.
//  Copyright (c) 2016年 xcs. All rights reserved.
//

#import "AppDelegate.h"
#import "XCSTabBarController.h"
#import "UMSocial.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    1、初始化window窗口
    self.window = [[UIWindow alloc] initWithFrame:windowRect];
//    2、设置窗口的根控制器
    self.window.rootViewController = [[XCSTabBarController alloc] init];
    
//    3、使窗口可见
    [self.window makeKeyAndVisible];
    
//    4、设置状态条的颜色为白色
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
//    5、设置友盟社会化分享的appkey
    [UMSocialData setAppKey:@"56faa89167e58eaf62001a67"];
    
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
