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
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deploymentDidUpdate:) name:@"deploymentDidUpdate" object:nil];
  [spinner startAnimating];
  [self setupTimer];
}

- (void)setupTimer {
  [NSThread detachNewThreadSelector:@selector(updateDeployment) toTarget:self withObject:nil];
}

- (void)deploymentDidUpdate:(NSNotification *)notification {
  [deploymentLog performSelectorOnMainThread:@selector(setText:) withObject:[deployment log] waitUntilDone:YES];
}

- (void)updateDeployment {
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
  while (YES) {
    [deployment update];
    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"deploymentDidUpdate" object:[deployment log]]];
    if ([deployment wasSuccessful]) {
      [spinner performSelectorOnMainThread:@selector(stopAnimating) withObject:nil waitUntilDone:YES];
      return;
    }
    [NSThread sleepForTimeInterval:1.0];
  }
  [pool release];
}
@end
