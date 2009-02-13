//
//  OperationQueue.m
//  imacistrano
//
//  Created by Pom on 12.02.09.
//  Copyright 2009 agelion. All rights reserved.
//

#import "OperationQueue.h"


@implementation OperationQueue

static NSOperationQueue *operationQueue = nil;

+ (NSOperationQueue *)sharedOperationQueue {
  @synchronized(self) {
    if (operationQueue == nil) {
      operationQueue = [[NSOperationQueue alloc] init];
    }
  }
  return operationQueue;
}
@end
