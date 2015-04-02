//
//  AppDelegate.m
//  PushWithCategory
//
//  Created by Atsushi Nakatsugawa on 2015/04/02.
//  Copyright (c) 2015年 Atsushi Nakatsugawa. All rights reserved.
//

#import "AppDelegate.h"
#import <NCMB/NCMB.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [NCMB setApplicationKey:@"APPLICATION_KEY" clientKey:@"CLIENT_KEY"];
    // Override point for customization after application launch.
    if (NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_1){
        //各通知アクションの生成
        UIMutableUserNotificationAction *action1 = [[UIMutableUserNotificationAction alloc] init];
        action1.title = @"はい";
        action1.identifier = @"id1";
        
        UIMutableUserNotificationAction *action2 = [[UIMutableUserNotificationAction alloc] init];
        action2.title = @"いいえ";
        action2.identifier = @"id2";
        
        UIMutableUserNotificationAction *action3 = [[UIMutableUserNotificationAction alloc] init];
        action3.title = @"内容による";
        action3.identifier = @"id3";
        
        UIMutableUserNotificationAction *action4 = [[UIMutableUserNotificationAction alloc] init];
        action4.title = @"・・・";
        action4.identifier = @"id4";
        
        //通知カテゴリに各アクションを登録
        UIMutableUserNotificationCategory *category = [[UIMutableUserNotificationCategory alloc] init];
        category.identifier = @"ACTION_CATEGORY";
        [category setActions:@[action1, action2, action3, action4] forContext:UIUserNotificationActionContextDefault];
        
        UIUserNotificationType types = UIUserNotificationTypeBadge |  UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
        //カテゴリをセッティングに設定
        UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:[NSSet setWithObject:category]];
        //プッシュ通知に登録
        [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
    } else {
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
         (UIRemoteNotificationTypeAlert |
          UIRemoteNotificationTypeBadge |
          UIRemoteNotificationTypeSound)];
    }
    return YES;
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    //register to receive notifications
    [application registerForRemoteNotifications];
}

// 配信端末情報を登録する。
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NCMBInstallation *currentInstallation = [NCMBInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:deviceToken];
    [currentInstallation save:nil];
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void (^)())completionHandler {
    
    if ([identifier isEqualToString:@"id1"]) {
        // はい の処理
        
    }
    
    if ([identifier isEqualToString:@"id2"]) {
        // いいえ の処理
        
    }
    
    if ([identifier isEqualToString:@"id3"]) {
        // 内容による の処理
        
    }
    
    if ([identifier isEqualToString:@"id3"]) {
        // ・・・ の処理
        
    }
    
    // 終了時に必ず呼ぶこと
    completionHandler();
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
