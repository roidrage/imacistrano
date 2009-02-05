//
//  Host.m
//  imacistrano
//
//  Created by Pom on 28.09.08.
//  Copyright 2008 agelion. All rights reserved.
//

#import "Host.h"


@implementation Host
@synthesize name;

- (id)initWithName:(NSString *)newName {
  if ([self init]) {
    self.name = newName;
    return self;
  }
  return nil;
}

+ (Host*)hostWithName:(NSString *)name {
  return [[[self alloc] initWithName:name] autorelease];
}
@end
