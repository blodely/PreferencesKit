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
		tableview.frame = CGRectZero;
		tableview.delegate = self;
		tableview.dataSource = self;
		[self addSubview:tableview];
		tbPreferences = tableview;
		
		[tbPreferences registerNib:[UINib nibWithNibName:@"PreferencesBaseCell" bundle:[NSBundle bundleWithPath:@""]] forCellReuseIdentifier:PreferencesBaseCellIdentifier];
	}
}

/*
// ONLY OVERRIDE drawRect: IF YOU PERFORM CUSTOM DRAWING.
// AN EMPTY IMPLEMENTATION ADVERSELY AFFECTS PERFORMANCE DURING ANIMATION.
- (void)drawRect:(CGRect)rect {
	// DRAWING CODE
}
*/

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

#pragma mark | UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return [_datasource count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [_datasource[section][PK_SECTION_ITEMS] count];
}


@end
