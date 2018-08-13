//
//  PreferencesGroupCell.m
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

#import "PreferencesGroupCell.h"
#import <Masonry/Masonry.h>
#import <LYCategory/LYCategory.h>

NSString *const PreferencesGroupCellIdentifier = @"PreferencesGroupCellIdentifier";

@interface PreferencesGroupCell () {}
@end

@implementation PreferencesGroupCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
		
		{
			// SELF CONFIGURATIONS
			self.selectionStyle = UITableViewCellSelectionStyleNone;
			self.backgroundColor = [UIColor colorWithHex:@"#f2f2f2" andAlpha:1.0];
		}
		
		{
			UILabel *label = [[UILabel alloc] init];
			[self addSubview:label];
			_lblTitle = label;
			
			_lblTitle.font = [UIFont systemFontOfSize:14];
			_lblTitle.textColor = [UIColor darkGrayColor];
			
			[_lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
				make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(20, 12, 12, 12));
				make.height.mas_equalTo(20);
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
