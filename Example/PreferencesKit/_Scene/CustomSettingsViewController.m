//
//  CustomSettingsViewController.m
//  PreferencesSample
//
//  Created by Luo Yu on 7/21/16.
//  Copyright © 2016 Luo Yu. All rights reserved.
//

#import "CustomSettingsViewController.h"
#import "LYPreferencesKit.h"

@interface CustomSettingsViewController () <PreferencesViewDelegate>

@end

@implementation CustomSettingsViewController

- (instancetype)init {
	if (self = [super initWithNibName:@"CustomSettingsViewController" bundle:[NSBundle mainBundle]]) {
	}
	return self;
}

- (void)loadView {
	[super loadView];
	
	self.navigationItem.title = @"Custom Settings";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // DO ANY ADDITIONAL SETUP AFTER LOADING THE VIEW FROM ITS NIB.
	
	self.pvSettings.datasource = [NSFileManager preferencesReader];
	[self.pvSettings reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // DISPOSE OF ANY RESOURCES THAT CAN BE RECREATED.
}

#pragma mark - DELEGATE

#pragma mark | PreferencesViewDelegate


@end
