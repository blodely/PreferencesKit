//
//  PKEntity.h
//  PreferencesSample
//
//  CREATED BY LUO YU ON 2016-07-21.
//  COPYRIGHT © 2016 LUO YU. ALL RIGHTS RESERVED.
//

#import <Foundation/Foundation.h>

typedef enum {
	PKEntityTypeBoolean = 1,
	PKEntityTypeSectionNumber = 2,
	PKEntityTypeNumberInt = 3,
	PKEntityTypeNumberDouble = 4,
	PKEntityTypeString = 11,
} PKEntityType;

@interface PKEntity : NSObject <NSCoding, NSCopying>

- (instancetype)initWithType:(PKEntityType)atype;

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, readonly) PKEntityType type;
@property (nonatomic) id value;
@property (nonatomic, assign) BOOL valueBool;
@property (nonatomic, assign) NSInteger valueInt;
@property (nonatomic, assign) double valueDouble;

@end
