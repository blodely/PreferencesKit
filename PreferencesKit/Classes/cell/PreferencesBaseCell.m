//
//  PreferencesBaseCell.m
//  PreferencesKit
//
//  CREATED BY LUO YU ON 2017-04-29.
//  COPYRIGHT © 2016 LUO YU. ALL RIGHTS RESERVED.
//

#import "PreferencesBaseCell.h"
#import <Masonry/Masonry.h>

NSString *const PreferencesBaseCellIdentifier = @"PreferencesBaseCellIdentifier";

@implementation PreferencesBaseCell

- (void)awakeFromNib {
	[super awakeFromNib];
	// INITIALIZATION CODE
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

	// CONFIGURE THE VIEW FOR THE SELECTED STATE
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
		
		{
			UILabel *label = [[UILabel alloc] init];
			label.frame = (CGRect){10, 2, 200, 20};
			[self addSubview:label];
			_lblTitle = label;
			
			UIEdgeInsets padding = UIEdgeInsetsMake(12, 12, 12, 12);
			[_lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
				make.height.mas_equalTo(20);
				make.edges.equalTo(self).with.insets(padding);
			}];
		}
		
	}
	return self;
}

@end
