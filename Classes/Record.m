//
//  Task.m
//  imacistrano
//
//  Created by Pom on 05.02.09.
//  Copyright 2009 agelion. All rights reserved.
//

#import "Record.h"


@implementation Record
@synthesize recordId, name, description;

+ (NSString *)getRemoteCollectionName {
  return @"projects";
}

@end
