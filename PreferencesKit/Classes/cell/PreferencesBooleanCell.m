//
//  PreferencesBooleanCell.m
//  PREFERENCESKIT
//
//  CREATED BY LUO YU ON 2018-08-13.
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

#import "PreferencesBooleanCell.h"
#import <Masonry/Masonry.h>

NSString *const PreferencesBooleanCellIdentifier = @"PreferencesBooleanCellIdentifier";

@implementation PreferencesBooleanCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
		
		{
			// SETUP
			self.selectionStyle = UITableViewCellSelectionStyleNone;
			self.clipsToBounds = YES;
		}
		
		{
			// TITLE
			UILabel *label = [[UILabel alloc] init];
			[self addSubview:label];
			_lblTitle = label;
			
			_lblTitle.backgroundColor = [UIColor lightGrayColor];
		}
		
		{
			// TOGGLE
			UISwitch *switchui = [[UISwitch alloc] initWithFrame:CGRectZero];
			[self addSubview:switchui];
			_swToggle = switchui;
		}
		
		{
			// AUTO LAYOUT
			
			[_lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
				make.left.equalTo(self.mas_left).with.offset(12);
				make.top.equalTo(self.mas_top).with.offset(12);
				make.bottom.equalTo(self.mas_bottom).with.offset(12);
				make.height.mas_equalTo(20);
//				make.right.equalTo(self->_swToggle.mas_left).with.mas_offset(8);
			}];
			[_swToggle mas_makeConstraints:^(MASConstraintMaker *make) {
				make.right.equalTo(self).mas_offset(12);
				make.centerY.equalTo(self.m);
			}];
			
		}
	}
	return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
