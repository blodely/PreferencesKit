//
//  PreferencesBaseCell.m
//  PreferencesKit
//
//  CREATED BY LUO YU ON 2017-04-29.
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
