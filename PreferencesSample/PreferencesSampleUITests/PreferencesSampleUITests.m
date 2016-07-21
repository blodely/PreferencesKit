//
//  PreferencesSampleUITests.m
//  PreferencesSampleUITests
//
//  Created by Luo Yu on 7/21/16.
//  Copyright © 2016 Luo Yu. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface PreferencesSampleUITests : XCTestCase

@end

@implementation PreferencesSampleUITests

- (void)setUp {
    [super setUp];
    
    // PUT SETUP CODE HERE.
	// THIS METHOD IS CALLED BEFORE THE INVOCATION OF EACH TEST METHOD IN THE CLASS.
    
    // IN UI TESTS IT IS USUALLY BEST TO STOP IMMEDIATELY WHEN A FAILURE OCCURS.
    self.continueAfterFailure = NO;
    // UI TESTS MUST LAUNCH THE APPLICATION THAT THEY TEST.
	// DOING THIS IN SETUP WILL MAKE SURE IT HAPPENS FOR EACH TEST METHOD.
    [[[XCUIApplication alloc] init] launch];
    
    // IN UI TESTS IT’S IMPORTANT TO SET THE INITIAL STATE - SUCH AS INTERFACE ORIENTATION -
	// REQUIRED FOR YOUR TESTS BEFORE THEY RUN. THE SETUP METHOD IS A GOOD PLACE TO DO THIS.
}

- (void)tearDown {
    // PUT TEARDOWN CODE HERE. THIS METHOD IS CALLED AFTER THE INVOCATION
	// OF EACH TEST METHOD IN THE CLASS.
    [super tearDown];
}

- (void)testExample {
    // USE RECORDING TO GET STARTED WRITING UI TESTS.
    // USE XCTASSERT AND RELATED FUNCTIONS TO VERIFY YOUR TESTS PRODUCE THE CORRECT RESULTS.
}

@end
