//
//  Stage.m
//  imacistrano
//
//  Created by Pom on 05.02.09.
//  Copyright 2009 agelion. All rights reserved.
//

#import "Stage.h"
#import "Record.h"

@implementation Stage

@synthesize name;
@synthesize projectId;
@synthesize stageId;

+ (NSString *)getRemoteCollectionName {
  return @"projects";
}

- (NSArray *)findAllTasks {
  return [Record findRemote:[NSString stringWithFormat:@"%@/%@/%@/%@", projectId, @"stages", stageId, @"tasks", nil]];
}

- (NSDictionary *)dumpKeys {
  return [NSDictionary dictionaryWithObjectsAndKeys:[self projectId], @"projectId", [self stageId], @"stageId", nil];
}
@end
