//
//  PKEntity.h
//  PreferencesSample
//
//  CREATED BY LUO YU ON 2016-07-21.
//  COPYRIGHT © 2016 LUO YU. ALL RIGHTS RESERVED.
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
