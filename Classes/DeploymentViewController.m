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
  [self setupTimer];
  [spinner startAnimating];
  [super viewDidLoad];
}

- (void)setupTimer {
  deploymentTimer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(updateDeployment:) userInfo:nil repeats:YES];
}

- (void)updateDeployment:(NSTimer*)timer {
  [deployment update];
  [deploymentLog setText:[deployment log]];
  if ([deployment wasSuccessful]) {
    [deploymentTimer invalidate];
    [spinner stopAnimating];
  }
}
@end
