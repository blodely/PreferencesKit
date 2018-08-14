//
//  PreferencesView.m
//  PreferencesSample
//
//  CREATED BY LUO YU ON 2016-07-21.
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

#import "PreferencesView.h"
#import "PreferencesBaseCell.h"
#import "PreferencesGroupCell.h"
#import "PreferencesBooleanCell.h"
#import "PreferencesSectionCell.h"
#import "PKEntity.h"
#import <Masonry/Masonry.h>

@interface PreferencesView () <UITableViewDelegate, UITableViewDataSource> {
	
	__weak UITableView *tbPreferences;
	
}
@end

@implementation PreferencesView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		[self initial];
	}
	return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		[self initial];
	}
	return self;
}

- (void)initial {
	NSLog(@"RUN");
	self.backgroundColor = [UIColor whiteColor];
	
	{
		UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
		tableview.delegate = self;
		tableview.dataSource = self;
		[self addSubview:tableview];
		tbPreferences = tableview;
		
		[tbPreferences mas_makeConstraints:^(MASConstraintMaker *make) {
			make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
		}];
		
		[tbPreferences registerClass:[PreferencesGroupCell class] forCellReuseIdentifier:PreferencesGroupCellIdentifier];
		[tbPreferences registerClass:[PreferencesBaseCell class] forCellReuseIdentifier:PreferencesBaseCellIdentifier];
		[tbPreferences registerClass:[PreferencesBooleanCell class] forCellReuseIdentifier:PreferencesBooleanCellIdentifier];
		[tbPreferences registerClass:[PreferencesSectionCell class] forCellReuseIdentifier:PreferencesSectionCellIdentifier];
	}
}

/*
// ONLY OVERRIDE drawRect: IF YOU PERFORM CUSTOM DRAWING.
// AN EMPTY IMPLEMENTATION ADVERSELY AFFECTS PERFORMANCE DURING ANIMATION.
- (void)drawRect:(CGRect)rect {
	// DRAWING CODE
}
*/

- (void)setFrame:(CGRect)frame {
	[super setFrame:frame];
	
	tbPreferences.frame = (CGRect){0, 0, frame.size.width, frame.size.height};
}

#pragma mark - PROPERTY

- (void)setDatasource:(NSArray *)datasource {
	_datasource = datasource;
}

#pragma mark - METHOD

- (void)reloadData {
	[tbPreferences reloadData];
	
	[tbPreferences setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

#pragma mark - DELEGATE

#pragma mark | UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)idp {
	[tableView deselectRowAtIndexPath:idp animated:YES];
}

#pragma mark | UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)idp {
	
	if (idp.row == 0) {
		// GROUP TITLE CELL
		
		PreferencesGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:PreferencesGroupCellIdentifier forIndexPath:idp];
		cell.lblTitle.text = _datasource[idp.section][PK_SECTION_TITLE];
		return cell;
	}
	
	__weak PKEntity *item = _datasource[idp.section][PK_SECTION_ITEMS][idp.row - 1];
	
	switch (item.type) {
		case PKEntityTypeBoolean: {
			PreferencesBooleanCell *cell = [tableView dequeueReusableCellWithIdentifier:PreferencesBooleanCellIdentifier forIndexPath:idp];
			cell.lblTitle.text = item.title;
			cell.swToggle.selected = item.valueBool;
			return cell;
		} break;
		case PKEntityTypeSectionNumber: {
			PreferencesSectionCell *cell = [tableView dequeueReusableCellWithIdentifier:PreferencesSectionCellIdentifier forIndexPath:idp];
			cell.lblTitle.text = item.title;
			for (int i = 0; i < [item.value count]; i++) {
				[cell.seg insertSegmentWithTitle:[NSString stringWithFormat:@"%@", item.value[i]] atIndex:i animated:NO];
			}
			return cell;
		} break;
		default: {
			
		} break;
	}
	
	PreferencesBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:PreferencesBaseCellIdentifier forIndexPath:idp];
	cell.lblTitle.text = item.title;
	return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return [_datasource count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [_datasource[section][PK_SECTION_ITEMS] count] + 1;
}


@end
