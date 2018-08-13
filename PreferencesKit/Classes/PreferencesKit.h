//
//  PreferencesKit.h
//  PreferencesSample
//
//  CREATED BY LUO YU ON 2016-07-21.
//  COPYRIGHT © 2016 LUO YU. ALL RIGHTS RESERVED.
//

#import <Foundation/Foundation.h>
#import <PreferencesKit/PKEntity.h>
#import <PreferencesKit/PreferencesView.h>
#import <PreferencesKit/NSFileManager+PreferencesKit.h>

FOUNDATION_EXPORT NSString *const PK_TITLE;
FOUNDATION_EXPORT NSString *const PK_ITEM;

@interface PreferencesKit : NSObject

/**
 *  Shared Instance
 *
 *  @return shared preferences kit instance.
 */
+ (instancetype)kit;

@end
