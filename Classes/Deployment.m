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
#import "OperationQueue.h"

@interface Deployment (PrivateInterface)
-(void)createAndFindLatest;
@end

@implementation Deployment
@synthesize task, description, deploymentId, log, status, stage, projectId, stageId, stage;

+ (NSString *)getRemoteCollectionPathWithParameters:(NSDictionary *)parameters {
  return [NSString stringWithFormat:@"%@%@/%@/%@/%@/%@.xml",
          [self getRemoteSite], [Project getRemoteCollectionName],
          [parameters objectForKey:@"projectId"], @"stages",
          [parameters objectForKey:@"stageId"], [self getRemoteCollectionName]];
}

- (void)update {
  NSLog(@"update: %@, %@", [self projectId], [self stageId]);
  NSString *oldProjectId = [self projectId];
  NSString *deploymentPath = [NSString stringWithFormat:@"%@%@/%@/%@/%@/%@/%@%@",
                       [[self class] getRemoteSite],
                       [Project getRemoteCollectionName],
                       [self projectId],
                       @"stages", [self stageId],
                       [[self class] getRemoteCollectionName],
                       [self deploymentId],
                       [[self class] getRemoteProtocolExtension]];
  
  Response *res = [Connection get:deploymentPath withUser:[[self class] getRemoteUser] 
                      andPassword:[[self class] getRemotePassword]];
  
  [self setProperties:[[[self class] fromXMLData:res.body] properties]];
  [self setProjectId:oldProjectId];
}

- (BOOL)wasSuccessful {
  return [[self status] isEqualToString:@"success"];
}

- (void)runCreate {
  NSInvocationOperation* theOp = [[NSInvocationOperation alloc]
                                   initWithTarget:self
                                   selector:@selector(createAndFindLatest:)
                                   object:nil];
  NSOperationQueue *queue = [OperationQueue sharedOperationQueue];
  [queue addOperation:theOp];
}

- (void)createAndFindLatest:(id)data {
  [self createRemoteWithParameters:[NSDictionary dictionaryWithObjectsAndKeys:
                                          [[self stage] projectId], @"projectId", [[self stage] stageId],
                                          @"stageId", nil]];
  Deployment *deployment = [Deployment latest:[stage dumpKeys]];
  while (deployment == nil) {
    deployment = [Deployment latest:[stage dumpKeys]];
  }
  
  [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"deploymentDidLoad" object:deployment]];
}

+ (Deployment *)latest:(NSDictionary*)parameters {
  NSString *latestDeploymentPath = [NSString stringWithFormat:@"%@projects/%@/stages/%@/%@/latest%@",
                                    [self getRemoteSite], [parameters objectForKey:@"projectId"],
                                    [parameters objectForKey:@"stageId"], [self getRemoteCollectionName], [self getRemoteProtocolExtension]];
  
  Response *res = [Connection get:latestDeploymentPath withUser:[self getRemoteUser]
                      andPassword:[self getRemotePassword]];
  if ([[res body] length] == 0) {
    return nil;
  }
  Deployment * deployment = [[Deployment alloc] init];
  [deployment setProperties:[[self fromXMLData:res.body] properties]];
  [deployment setProjectId:[parameters objectForKey:@"projectId"]];
  [deployment setStageId:[parameters objectForKey:@"stageId"]];
  return deployment;
}

@end
