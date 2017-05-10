//
//  NSFileManager+PreferencesKit.m
//  PreferencesSample
//
//  CREATED BY LUO YU ON 2016-07-21.
//  COPYRIGHT © 2016 LUO YU. ALL RIGHTS RESERVED.
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
		
		for (NSDictionary *one in reader) {
			
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
							  PK_SECTION_ITEMS: [secSettings count] > 0 ? [NSArray arrayWithArray:secSettings] : @[],
							  }];
	}
	
	if ([settings count] > 0) {
		return [NSArray arrayWithArray:settings];
	}
	
	return nil;
}

@end
