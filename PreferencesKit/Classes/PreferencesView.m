//
//  PreferencesView.m
//  PreferencesSample
//
//  CREATED BY LUO YU ON 2016-07-21.
//  COPYRIGHT © 2016 LUO YU. ALL RIGHTS RESERVED.
//

#import "PreferencesView.h"
#import "PreferencesBaseCell.h"
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
		
		UIEdgeInsets padding = UIEdgeInsetsMake(0, 0, 0, 0);
		[tbPreferences mas_makeConstraints:^(MASConstraintMaker *make) {
			make.edges.equalTo(self).with.insets(padding);
		}];
		
		tbPreferences.separatorStyle = UITableViewCellSeparatorStyleNone;
		
		[tbPreferences registerClass:[PreferencesBaseCell class] forCellReuseIdentifier:PreferencesBaseCellIdentifier];
//		[tbPreferences registerNib:[UINib nibWithNibName:@"PreferencesBaseCell" bundle:[NSBundle bundleWithPath:@""]] forCellReuseIdentifier:PreferencesBaseCellIdentifier];
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
}

#pragma mark - DELEGATE

#pragma mark | UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)idp {
	[tableView deselectRowAtIndexPath:idp animated:YES];
}

#pragma mark | UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)idp {
	
	__weak PKEntity *item = _datasource[idp.section][PK_SECTION_ITEMS][idp.row];
	
	PreferencesBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:PreferencesBaseCellIdentifier forIndexPath:idp];
	cell.lblTitle.text = item.title;
	return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return [_datasource count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [_datasource[section][PK_SECTION_ITEMS] count];
}


@end
