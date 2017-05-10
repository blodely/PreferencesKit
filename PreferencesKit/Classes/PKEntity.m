//
//  PKEntity.m
//  PreferencesSample
//
//  CREATED BY LUO YU ON 2016-07-21.
//  COPYRIGHT © 2016 LUO YU. ALL RIGHTS RESERVED.
//

#import "PKEntity.h"
#import "LYPreferencesKit.h"

NSString *const PK_SECTION_TITLE = @"pk.section.title";
NSString *const PK_SECTION_ITEMS = @"pk.section.items";

NSString *const PK_ENTITY_NAME = @"pk.entity.name";
NSString *const PK_ENTITY_TYPE = @"pk.entity.type";
NSString *const PK_ENTITY_TITLE = @"pk.entity.title";
NSString *const PK_ENTITY_SUBTITLE = @"pk.entity.subtitle";
NSString *const PK_ENTITY_VALUE = @"pk.entity.value";

@implementation PKEntity

- (instancetype)initWithType:(PKEntityType)atype {
	if (self = [super init]) {
		_type = atype;
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)coder {
	self = [super init];
	if (self) {
		self.name = [coder decodeObjectForKey:@"self.name"];
		self.title = [coder decodeObjectForKey:@"self.title"];
		self.subtitle = [coder decodeObjectForKey:@"self.subtitle"];
		_type = (PKEntityType) [coder decodeIntForKey:@"_type"];
		
		switch (_type) {
			case PKEntityTypeBoolean:
				self.valueBool = [coder decodeBoolForKey:@"self.value"];
				break;
			case PKEntityTypeSectionNumber:
			case PKEntityTypeNumberDouble:
				self.valueDouble = [coder decodeDoubleForKey:@"self.value"];
				break;
			case PKEntityTypeNumberInt:
				self.valueInt = [coder decodeIntegerForKey:@"self.value"];
				break;
			case PKEntityTypeString:
				self.value = [coder decodeObjectForKey:@"self.value"];
				break;
			default: break;
		}
	}

	return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.name forKey:@"self.name"];
	[coder encodeObject:self.title forKey:@"self.title"];
	[coder encodeObject:self.subtitle forKey:@"self.subtitle"];
	[coder encodeInt:self.type forKey:@"_type"];
	
	switch (_type) {
		case PKEntityTypeBoolean:
			[coder encodeBool:self.valueBool forKey:@"self.value"];
			break;
		case PKEntityTypeSectionNumber:
		case PKEntityTypeNumberDouble:
			[coder encodeDouble:self.valueDouble forKey:@"self.value"];
			break;
		case PKEntityTypeNumberInt:
			[coder encodeInteger:self.valueInt forKey:@"self.value"];
			break;
		case PKEntityTypeString:
			[coder encodeObject:self.value forKey:@"self.value"];
			break;
		default: break;
	}
}

- (id)copyWithZone:(NSZone *)zone {
	PKEntity *copy = (PKEntity *) [[[self class] allocWithZone:zone] init];

	if (copy != nil) {
		copy.name = self.name;
		copy.title = self.title;
		copy.subtitle = self.subtitle;
		copy->_type = _type;
		copy.value = self.value;
		copy.valueInt = self.valueInt;
		copy.valueDouble = self.valueDouble;
		copy.valueBool = self.valueBool;
	}

	return copy;
}

- (NSString *)description {
	return [NSString stringWithFormat:@"PKEntity {\n\tName=%@\n\tTitle=%@\n\tSubtitle=%@\n\tType=%@\n}",
			_name,
			_title,
			_subtitle,
			@(_type)
			];
}

@end
