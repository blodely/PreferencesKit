//
//  NSFileManager+PreferencesKit.m
//  PreferencesKit
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

#import "NSFileManager+PreferencesKit.h"
#import <FCFileManager/FCFileManager.h>
//#import <GDataXML_HTML/GDataXMLNode.h>
#import "PKEntity.h"
#import "NSArray+PreferencesKit.h"

@implementation NSFileManager (PreferencesKit)

+ (NSMutableArray *)preferencesReader {
	
	NSString *filepath = [NSHomeDirectory() stringByAppendingString:@"/Documents/ly.preferences.kit"];
	NSString *filename = [filepath stringByAppendingString:@"/preferences.kit.plist"];
	
	if ([FCFileManager isDirectoryItemAtPath:filepath] == NO) {
		
		// NO DIRECTORY WAS FOUND
		
		// CREATE
		[FCFileManager createDirectoriesForPath:filepath];
		
		// STOP HERE
		return nil;
	}
	
	if ([FCFileManager isFileItemAtPath:filename] == NO) {
		// NO FILE WAS FOUND
		return nil;
	}
	
	return [[FCFileManager readFileAtPathAsArray:filename] generatePreferencesDatasource];
}

+ (void)preferencesWriter:(NSArray *)prefData {
	
	// VALID DATA GONNA WRITE
	if (prefData == nil) {
		return;
	}
	
	// THEN, WRITE TO DISK
	
}

@end
