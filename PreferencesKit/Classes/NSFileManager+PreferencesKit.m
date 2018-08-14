//
//  NSFileManager+PreferencesKit.m
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

#import "NSFileManager+PreferencesKit.h"
#import <FCFileManager/FCFileManager.h>
//#import <GDataXML_HTML/GDataXMLNode.h>
#import "PKEntity.h"

@implementation NSFileManager (PreferencesKit)

+ (NSArray *)preferencesReader {
	
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
	
	NSArray *reader = [FCFileManager readFileAtPathAsArray:filename];
	
	NSMutableArray *settings = [NSMutableArray arrayWithCapacity:1];
	
	for (NSDictionary *section in reader) {
		
		NSMutableArray *secSettings = [NSMutableArray arrayWithCapacity:1];
		
		for (NSDictionary *one in section[PK_SECTION_ITEMS]) {
			
			PKEntityType type = PKEntityTypeNone;
			
			type = [one[PK_ENTITY_TYPE] integerValue];
			
			PKEntity *entity = [[PKEntity alloc] initWithType:type];
			
			entity.name = [NSString stringWithFormat:@"%@", one[PK_ENTITY_NAME]];
			entity.title = [NSString stringWithFormat:@"%@", one[PK_ENTITY_TITLE]];
			entity.subtitle = [NSString stringWithFormat:@"%@", one[PK_ENTITY_SUBTITLE]];
			
			switch (type) {
				case PKEntityTypeNone: {
					entity.value = nil;
				}
					break;
				case PKEntityTypeBoolean: {
					entity.valueBool = [one[PK_ENTITY_VALUE] boolValue];
				}
					break;
				case PKEntityTypeSectionNumber: {
					entity.value = one[PK_ENTITY_VALUE];
				}
					break;
				case PKEntityTypeNumberInt: {
					entity.valueInt = [one[PK_ENTITY_VALUE] integerValue];
				}
					break;
				case PKEntityTypeNumberDouble: {
					entity.valueDouble = [one[PK_ENTITY_VALUE] doubleValue];
				}
					break;
				case PKEntityTypeString: {
					entity.value = [NSString stringWithFormat:@"%@", one[PK_ENTITY_VALUE]];
				}
					break;
				default: {
					entity.value = one[PK_ENTITY_VALUE];
				}
					break;
			}
			
			[secSettings addObject:entity];
		}
		
		[settings addObject:@{
							  PK_SECTION_TITLE:section[PK_SECTION_TITLE],
							  PK_SECTION_ITEMS: [secSettings count] > 0 ? secSettings : [@[] mutableCopy],
							  }];
	}
	
	if ([settings count] > 0) {
		return settings;
	}
	
	return nil;
}

+ (void)preferencesWriter:(NSArray *)prefData {
	
	// VALID DATA GONNA WRITE
	if (prefData == nil) {
		return;
	}
	
	// THEN, WRITE TO DISK
	
}

@end
