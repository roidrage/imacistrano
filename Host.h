//
//  Host.h
//  imacistrano
//
//  Created by Pom on 28.09.08.
//  Copyright 2008 agelion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Project.h"

@interface Host : NSObject {
  NSString * name;
  Project * projects;
}

@property (copy,nonatomic) NSString *name;

+(Host *)hostWithName:(NSString*)newName;
@end
