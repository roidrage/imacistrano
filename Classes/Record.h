//
//  Task.h
//  imacistrano
//
//  Created by Pom on 05.02.09.
//  Copyright 2009 agelion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ObjectiveResource.h"

@interface Record : NSObject {
  NSString *recordId;
  NSString *name;
  NSString *description;
}

@property (copy, nonatomic) NSString *recordId;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *description;
@end
