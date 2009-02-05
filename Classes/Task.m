//
//  Task.m
//  imacistrano
//
//  Created by Pom on 05.02.09.
//  Copyright 2009 agelion. All rights reserved.
//

#import "Task.h"


@implementation Task
@synthesize taskId, name, description;

+ (NSString *)getRemoteCollectionName {
  return @"projects";
}

@end
