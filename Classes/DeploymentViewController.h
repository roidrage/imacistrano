//
//  DeploymentViewController.h
//  imacistrano
//
//  Created by Pom on 12.02.09.
//  Copyright 2009 agelion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deployment.h"
#import "Stage.h"

@interface DeploymentViewController : UIViewController {
  Deployment *deployment;
  Stage *stage;
  NSTimer *deploymentTimer;
  IBOutlet UITextView *deploymentLog;
  IBOutlet UIActivityIndicatorView *spinner;
}

@property (retain, nonatomic)Deployment *deployment;
@property (retain, nonatomic)Stage *stage;
@property (retain, nonatomic)NSTimer *deploymentTimer;
@end
