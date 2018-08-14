//
//  PreferencesKit.m
//  PreferencesSample
//
//  CREATED BY LUO YU ON 2016-07-21.
//
//	The MIT License (MIT)
//
//  COPYRIGHT © 2016~2018 LUO YU(骆昱, indie.luo@gmail.com). ALL RIGHTS RESERVED.
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights
//	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//	copies of the Software, and to permit persons to whom the Software is
//	furnished to do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in all
//	copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//	SOFTWARE.
//

#import "PreferencesKit.h"
#import <FCFileManager/FCFileManager.h>
#import <LYCategory/LYCategory.h>

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

// MARK: - PROPERTY

- (UIColor *)themeColor {
	if (_themeColor == nil) {
		return [UIView new].tintColor;
	}
	return _themeColor;
}

#pragma mark - FILE READ

// IN NSFileManager+PreferencesKit

#pragma mark | FILE WRITE


@end
