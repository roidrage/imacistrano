//
//  imacistranoAppDelegate.m
//  imacistrano
//
//  Created by Pom on 28.09.08.
//  Copyright agelion 2008. All rights reserved.
//

#import "imacistranoAppDelegate.h"
#import "ProjectsViewController.h"


@implementation imacistranoAppDelegate

@synthesize window;
@synthesize navigationController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	// Configure and show the window
	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}

@end
