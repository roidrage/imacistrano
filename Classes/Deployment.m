//
//  Deployment.m
//  imacistrano
//
//  Created by Pom on 11.02.09.
//  Copyright 2009 agelion. All rights reserved.
//

#import "Deployment.h"
#import "Project.h"
#import "Stage.h"

@implementation Deployment
@synthesize task, description, deploymentId, log, status;

+ (NSString *)getRemoteCollectionPathWithParameters:(NSDictionary *)parameters {
  return [NSString stringWithFormat:@"%@%@/%@/%@/%@/%@.xml",
          [self getRemoteSite], [Project getRemoteCollectionName],
          [parameters objectForKey:@"projectId"], @"stages",
          [parameters objectForKey:@"stageId"], [self getRemoteCollectionName]];
}
@end
