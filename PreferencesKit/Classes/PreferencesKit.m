//
//  PreferencesKit.m
//  PreferencesSample
//
//  CREATED BY LUO YU ON 2016-07-21.
//  COPYRIGHT © 2016 LUO YU. ALL RIGHTS RESERVED.
//

#import "PreferencesKit.h"
#import <FCFileManager/FCFileManager.h>

NSString *const PK_TITLE = @"PK_TITLE";
NSString *const PK_ITEM = @"PK_ITEM";

@interface PreferencesKit () {}
@end

static PreferencesKit *sharedPreferencesKit;

@implementation PreferencesKit

#pragma mark - INIT

- (instancetype)init {
	if (self = [super init]) {
	}
	return self;
}

+ (instancetype)kit {
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedPreferencesKit = [[PreferencesKit alloc] init];
	});
	return sharedPreferencesKit;
}

#pragma mark - FILE READ

// IN NSFileManager+PreferencesKit

#pragma mark | FILE WRITE


@end
