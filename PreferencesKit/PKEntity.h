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
	PKEntityTypeNumber = 3,
	PKEntityTypeString = 11,
} PKEntityType;

@interface PKEntity : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) PKEntityType type;

@end
