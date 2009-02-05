//
//  Stage.m
//  imacistrano
//
//  Created by Pom on 05.02.09.
//  Copyright 2009 agelion. All rights reserved.
//

#import "Stage.h"

@implementation Stage

@synthesize name;
@synthesize projectId;
@synthesize stageId;

+(NSArray*)findAllForProjectWithId:(NSString*)projectId {
  NSString *projectStagesPath = [NSString stringWithFormat:@"%@%@/%@/%@%@",
                                 [self getRemoteSite],
                                 [Project getRemoteCollectionName],
                                 projectId,
                                 [self getRemoteCollectionName],
                                 [self getRemoteProtocolExtension]];
  Response *response = [Connection get:projectStagesPath withUser:[[self class] getUser]
                           andPassword:[[self class] getPassword]];
  
  return [self allFromXMLData:[response body]];
}

+ (NSString *)getRemoteCollectionName {
  return @"projects";
}
@end
