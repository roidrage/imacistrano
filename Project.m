//
//  Project.m
//  imacistrano
//
//  Created by Pom on 28.09.08.
//  Copyright 2008 agelion. All rights reserved.
//

#import "Project.h"

@implementation Project
@synthesize name;
@synthesize projectId;

- (id)initWithName:(NSString *)projectName {
  if ([super init]) {
    self.name = projectName;
    return self;
  }
  return nil;
}

+ (Project *)projectWithName:(NSString *)name {
  return [[[self alloc] initWithName:name] autorelease];
}

- (NSArray *)findAllStages {
  return [Stage findRemote:[NSString stringWithFormat:@"%@/%@", projectId, @"stages", nil]];
}
@end
