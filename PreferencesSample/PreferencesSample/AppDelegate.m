//
//  AppDelegate.m
//  PreferencesSample
//
//  CREATED BY LUO YU ON 2016-07-21.
//  COPYRIGHT © 2016 LUO YU. ALL RIGHTS RESERVED.
//

#import "AppDelegate.h"
#import "FCFileManager.h"

#import "CustomSettingsViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// OVERRIDE POINT FOR CUSTOMIZATION AFTER APPLICATION LAUNCH.
	
//------------------------------------------------------------------------------------
	NSString *filename = [NSHomeDirectory() stringByAppendingString:@"/Documents/preferences_kit/configuration.plist"];
	if ([FCFileManager isFileItemAtPath:filename]) {
		NSArray *tempdata = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"testpresdata" ofType:@"plist"]];
		[FCFileManager writeFileAtPath:filename content:tempdata];
	}
//------------------------------------------------------------------------------------
	
	_window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	
	UITabBarController *tabs = [[UITabBarController alloc] init];
	
	UINavigationController *navCustom = [[UINavigationController alloc] initWithRootViewController:[[CustomSettingsViewController alloc] init]];
	navCustom.tabBarItem.title = @"Custom";
	navCustom.tabBarItem.image = [UIImage imageNamed:@""];
	navCustom.tabBarController.tabBar.translucent = NO;
	
	tabs.viewControllers = @[navCustom,];
	
	_window.rootViewController = tabs;
	
	[_window makeKeyAndVisible];
	
	return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
	// SENT WHEN THE APPLICATION IS ABOUT TO MOVE FROM ACTIVE TO INACTIVE STATE.
	// THIS CAN OCCUR FOR CERTAIN TYPES OF TEMPORARY INTERRUPTIONS
	// (SUCH AS AN INCOMING PHONE CALL OR SMS MESSAGE) OR WHEN THE USER QUITS THE APPLICATION
	// AND IT BEGINS THE TRANSITION TO THE BACKGROUND STATE.
	
	// USE THIS METHOD TO PAUSE ONGOING TASKS, DISABLE TIMERS, AND THROTTLE DOWN OPENGL ES FRAME RATES.
	// GAMES SHOULD USE THIS METHOD TO PAUSE THE GAME.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
	// USE THIS METHOD TO RELEASE SHARED RESOURCES, SAVE USER DATA, INVALIDATE TIMERS,
	// AND STORE ENOUGH APPLICATION STATE INFORMATION TO RESTORE YOUR APPLICATION
	// TO ITS CURRENT STATE IN CASE IT IS TERMINATED LATER.
	
	// IF YOUR APPLICATION SUPPORTS BACKGROUND EXECUTION, THIS METHOD IS CALLED
	// INSTEAD OF applicationWillTerminate: WHEN THE USER QUITS.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
	// CALLED AS PART OF THE TRANSITION FROM THE BACKGROUND TO THE INACTIVE STATE;
	// HERE YOU CAN UNDO MANY OF THE CHANGES MADE ON ENTERING THE BACKGROUND.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	// RESTART ANY TASKS THAT WERE PAUSED (OR NOT YET STARTED) WHILE THE APPLICATION WAS INACTIVE.
	// IF THE APPLICATION WAS PREVIOUSLY IN THE BACKGROUND, OPTIONALLY REFRESH THE USER INTERFACE.
}

- (void)applicationWillTerminate:(UIApplication *)application {
	// CALLED WHEN THE APPLICATION IS ABOUT TO TERMINATE. SAVE DATA IF APPROPRIATE.
	// SEE ALSO applicationDidEnterBackground:.
}

@end
