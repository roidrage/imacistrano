//
//  Project.h
//  imacistrano
//
//  Created by Pom on 28.09.08.
//  Copyright 2008 agelion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObjectiveResource.h"
#import "Stage.h"

@interface Project : NSObject {
  NSString *name;
  NSString *projectId;
}

@property (retain, nonatomic) NSString *name;
@property (nonatomic, retain) NSString *projectId;
+(Project*)projectWithName:(NSString*) name;
-(NSArray *)findAllStages;
@end
