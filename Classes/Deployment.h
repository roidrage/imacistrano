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

@property (retain, nonatomic) NSString *task;
@property (retain, nonatomic) NSString *description;
@property (retain, nonatomic) NSString *deploymentId;
@property (retain, nonatomic) NSString *status;
@property (retain, nonatomic) NSString *log;

@end