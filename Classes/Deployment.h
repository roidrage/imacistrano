//
//  Deployment.h
//  imacistrano
//
//  Created by Pom on 11.02.09.
//  Copyright 2009 agelion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObjectiveResource.h"

@interface Deployment : NSObject {
  NSString *task;
  NSString *description;
  NSString *deploymentId;
  NSString *projectId;
  NSString *stageId;
  NSString *status;
  NSString *log;
}

@property (copy, nonatomic) NSString *task;
@property (copy, nonatomic) NSString *description;
@property (copy, nonatomic) NSString *deploymentId;
@property (copy, nonatomic) NSString *status;
@property (copy, nonatomic) NSString *log;

@end