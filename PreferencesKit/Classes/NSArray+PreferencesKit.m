//
//  NSArray+PreferencesKit.m
//  PreferencesKit
//
//  CREATED BY LUO YU ON 2018-08-22.
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

#import "NSArray+PreferencesKit.h"
#import "PKEntity.h"

@implementation NSArray (PreferencesKit)

- (NSMutableArray *)generatePreferencesDatasource {
	
	NSMutableArray *settings = [NSMutableArray arrayWithCapacity:1];
	
	for (NSDictionary *section in self) {
		
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

@end

@implementation NSMutableArray (PreferencesKit)

- (void)setItemValue:(id)object atIndexPath:(NSIndexPath *)idp {
	
	NSString *title = self[idp.section][PK_SECTION_TITLE];
	NSMutableArray *group = self[idp.section][PK_SECTION_ITEMS];
	
	PKEntity *item = group[idp.row];
	
	switch (item.type) {
		case PKEntityTypeBoolean: {
			item.valueBool = [object boolValue];
		} break;
		case PKEntityTypeNumberInt: {
			item.valueInt = [object integerValue];
		} break;
		case PKEntityTypeNumberDouble: {
			item.valueDouble = [object doubleValue];
		} break;
		case PKEntityTypeSectionNumber: {
			
		} break;
		case PKEntityTypeString: {
			
		} break;
		case PKEntityTypeNone:
		default: {
			
		} break;
	}
	
	[group replaceObjectAtIndex:idp.row withObject:item];
	
	[self replaceObjectAtIndex:idp.section
					withObject:@{
								 PK_SECTION_TITLE:title,
								 PK_SECTION_ITEMS:group,
								 }];
}

@end
