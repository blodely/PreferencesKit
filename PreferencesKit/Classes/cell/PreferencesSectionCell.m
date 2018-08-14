//
//  PreferencesSectionCell.m
//  PREFERENCESKIT
//
//  CREATED BY LUO YU ON 2018-08-14.
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

#import "PreferencesSectionCell.h"
#import <Masonry/Masonry.h>
#import "PreferencesKit.h"

NSString *const PreferencesSectionCellIdentifier = @"PreferencesSectionCellIdentifier";

@implementation PreferencesSectionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
		
		{
			self.selectionStyle = UITableViewCellSelectionStyleNone;
		}
		
		{
			// TITLE LABEL
			UILabel *label = [[UILabel alloc] init];
			[self addSubview:label];
			_lblTitle = label;
		}
		
		{
			// SEGMENTED CONTROL
			UISegmentedControl *segment = [[UISegmentedControl alloc] init];
			[self addSubview:segment];
			_seg = segment;
			
			[_seg setTintColor:[PreferencesKit kit].themeColor];
		}
		
		{
			// AUTO-LAYOUT
			[_lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
				make.edges.equalTo(self).width.insets(UIEdgeInsetsMake(12, 12, 12, 100));
				make.height.mas_equalTo(20);
			}];
			[_seg mas_makeConstraints:^(MASConstraintMaker *make) {
				make.rightMargin.mas_equalTo(-4);
				make.height.mas_equalTo(32);
				make.centerY.equalTo(self);
			}];
		}
	}
	return self;
}

- (void)awakeFromNib {
	[super awakeFromNib];
	// INITIALIZATION CODE
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	[super setSelected:selected animated:animated];

	// CONFIGURE THE VIEW FOR THE SELECTED STATE
}

@end
