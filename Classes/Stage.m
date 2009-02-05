//
//  Stage.m
//  imacistrano
//
//  Created by Pom on 05.02.09.
//  Copyright 2009 agelion. All rights reserved.
//

#import "Stage.h"
#import "Task.h"

@implementation Stage

@synthesize name;
@synthesize projectId;
@synthesize stageId;

+ (NSString *)getRemoteCollectionName {
  return @"projects";
}

- (NSArray *)findAllTasks {
  NSLog(@"%@ %@", projectId, stageId);
//  return [Task findRemote:[NSString stringWithFormat:@"%@/%@/%@/%@", projectId, @"stages", stageId, @"tasks", nil]];
  return [NSArray new];
}
@end
