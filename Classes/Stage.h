//
//  Stage.h
//  imacistrano
//
//  Created by Pom on 05.02.09.
//  Copyright 2009 agelion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObjectiveResource.h"
#import "Project.h"
#import "Connection.h"
#import "Response.h"
#import "XMLSerializableSupport.h"

@interface Stage : NSObject {
  NSString *stageId;
  NSString *name;
  NSString *projectId;
}

@property (retain, nonatomic)NSString * stageId;
@property (retain, nonatomic)NSString *name;
@property (retain, nonatomic)NSString *projectId;

-(NSArray *)findAllTasks;
-(NSDictionary *)dumpKeys;
@end
