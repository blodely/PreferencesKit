//
//  PKEntity.m
//  PreferencesSample
//
//  CREATED BY LUO YU ON 2016-07-21.
//  COPYRIGHT © 2016 LUO YU. ALL RIGHTS RESERVED.
//

#import "PKEntity.h"

@implementation PKEntity

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
	self = [super init];
	if (self) {
		self.name = [aDecoder decodeObjectForKey:@"self.name"];
		self.type = (PKEntityType)[aDecoder decodeIntForKey:@"self.type"];
	}
	return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
	[coder encodeObject:self.name forKey:@"self.name"];
	[coder encodeInt:self.type forKey:@"self.type"];
}

- (id)copyWithZone:(NSZone *)zone {
	PKEntity *copy = (PKEntity *) [[[self class] allocWithZone:zone] init];

	if (copy != nil) {
		copy.name = self.name;
		copy.type = self.type;
	}

	return copy;
}


@end
