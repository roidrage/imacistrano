//
//  DeploymentViewController.m
//  imacistrano
//
//  Created by Pom on 12.02.09.
//  Copyright 2009 agelion. All rights reserved.
//

#import "DeploymentViewController.h"

@interface DeploymentViewController (PrivateInterface)
-(void)setupTimer;
@end

@implementation DeploymentViewController

@synthesize deployment, stage, deploymentTimer;

- (void)dealloc {
  [super dealloc];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [spinner startAnimating];
  [self setupTimer];
}

- (void)setupTimer {
  [NSThread detachNewThreadSelector:@selector(updateDeployment) toTarget:self withObject:nil];
}

- (void)updateDeployment {
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
  while (YES) {
    NSLog(@"running");
    [deployment update];
    NSLog(@"updated");
    [deploymentLog performSelectorOnMainThread:@selector(setText:) withObject:[deployment log] waitUntilDone:NO];
//    [deploymentLog setText:[deployment log]];
    NSLog(@"set text");
    if ([deployment wasSuccessful]) {
 //     [spinner stopAnimating];
      [spinner performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
      return;
    }
    NSLog(@"next");
    [NSThread sleepForTimeInterval:1.0];
  }
  [pool release];
}
@end
