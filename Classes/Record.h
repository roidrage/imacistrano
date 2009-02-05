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

@property (retain, nonatomic) NSString *recordId;
@property (retain, nonatomic) NSString *name;
@property (retain, nonatomic) NSString *description;
@end
