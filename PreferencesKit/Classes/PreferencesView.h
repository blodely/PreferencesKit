//
//  PreferencesView.h
//  PreferencesSample
//
//  CREATED BY LUO YU ON 2016-07-21.
//  COPYRIGHT © 2016 LUO YU. ALL RIGHTS RESERVED.
//

#import <UIKit/UIKit.h>

@class PreferencesView;

@protocol PreferencesViewDelegate <NSObject>

@end


//IB_DESIGNABLE
@interface PreferencesView : UIView

@property (nonatomic, strong, nullable) NSArray *datasource;

@property (nonatomic, weak, nullable) id <PreferencesViewDelegate> delegate;

- (void)reloadData;

@end
