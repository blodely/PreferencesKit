//
//  LYAppDelegate.m
//  PreferencesKit
//
//  Created by Luo Yu (MacBook Pro) on 11/22/2016.
//  Copyright (c) 2016 Luo Yu (MacBook Pro). All rights reserved.
//

#import "LYAppDelegate.h"
#import <PreferencesKit/PreferencesKit.h>
#import <FCFileManager/FCFileManager.h>
#import <LYCategory/LYCategory.h>

#import "CustomSettingsViewController.h"

@implementation LYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// OVERRIDE POINT FOR CUSTOMIZATION AFTER APPLICATION LAUNCH.
	
	//------------------------------------------------------------------------------------
	NSString *filename = [NSHomeDirectory() stringByAppendingString:@"/Documents/ly.preferences.kit/preferences.kit.plist"];
	NSLog(@"ADDRESS\n\n%@\n\n", filename);
	[FCFileManager removeItemAtPath:filename];
	if ([FCFileManager isFileItemAtPath:filename] == NO) {
		NSArray *tempdata = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"testpresdata" ofType:@"plist"]];
		[FCFileManager writeFileAtPath:filename content:tempdata];
	}
	//------------------------------------------------------------------------------------
	
	_window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	
	UITabBarController *tabs = [[UITabBarController alloc] init];
	
	UINavigationController *navCustom = [[UINavigationController alloc] initWithRootViewController:[[CustomSettingsViewController alloc] init]];
	navCustom.tabBarItem.title = @"Custom";
	navCustom.tabBarItem.image = [UIImage imageNamed:@"tab-custom"];
	navCustom.tabBarController.tabBar.translucent = NO;
	
	tabs.viewControllers = @[navCustom,];
	
	_window.rootViewController = tabs;
	
	[_window makeKeyAndVisible];
	
	[PreferencesKit kit].themeColor = [UIColor colorWithHex:@"#fb3800" andAlpha:1.0];
	
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
