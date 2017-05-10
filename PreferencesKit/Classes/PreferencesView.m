//
//  PreferencesView.m
//  PreferencesSample
//
//  CREATED BY LUO YU ON 2016-07-21.
//  COPYRIGHT © 2016 LUO YU. ALL RIGHTS RESERVED.
//

#import "PreferencesView.h"
#import "LYPreferencesKit.h"
#import "PreferencesBaseCell.h"

@interface PreferencesView () <UITableViewDelegate, UITableViewDataSource> {
	
	__weak UITableView *tbPreferences;
	
}
@end

@implementation PreferencesView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		
	}
	return self;
}

- (void)initial {
	
	
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
