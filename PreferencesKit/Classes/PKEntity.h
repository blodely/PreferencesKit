//
//  PKEntity.h
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

#import <Foundation/Foundation.h>

/**
 define preferencesKit entity type

 - PKEntityTypeNone: default type none
 - PKEntityTypeBoolean: switch type
 - PKEntityTypeSectionNumber: forgot
 - PKEntityTypeNumberInt: int number
 - PKEntityTypeNumberDouble: double number
 - PKEntityTypeString: string
 */
typedef NS_ENUM(NSInteger,  PKEntityType) {
	PKEntityTypeNone = 0,
	PKEntityTypeBoolean = 1,
	PKEntityTypeSectionNumber = 2,
	PKEntityTypeNumberInt = 3,
	PKEntityTypeNumberDouble = 4,
	PKEntityTypeString = 11,
};

FOUNDATION_EXPORT NSString *const PK_SECTION_TITLE;
FOUNDATION_EXPORT NSString *const PK_SECTION_ITEMS;

FOUNDATION_EXPORT NSString *const PK_ENTITY_NAME;
FOUNDATION_EXPORT NSString *const PK_ENTITY_TYPE;
FOUNDATION_EXPORT NSString *const PK_ENTITY_TITLE;
FOUNDATION_EXPORT NSString *const PK_ENTITY_SUBTITLE;
FOUNDATION_EXPORT NSString *const PK_ENTITY_VALUE;

@interface PKEntity : NSObject <NSCoding, NSCopying>

/**
 initial method

 @param atype entity type
 @return instance
 */
- (instancetype)initWithType:(PKEntityType)atype;

/**
 entity name
 */
@property (nonatomic, strong) NSString *name;

/**
 entity displayed title
 */
@property (nonatomic, strong) NSString *title;

/**
 entity displayed subtitle
 */
@property (nonatomic, strong) NSString *subtitle;

/**
 entity type, read only, setted by creation
 */
@property (nonatomic, readonly) PKEntityType type;

/**
 entity object value, id
 */
@property (nonatomic) id value;

/**
 entity boolean value
 */
@property (nonatomic, assign) BOOL valueBool;

/**
 entity integer value
 */
@property (nonatomic, assign) NSInteger valueInt;

/**
 entity double value
 */
@property (nonatomic, assign) double valueDouble;

@end
