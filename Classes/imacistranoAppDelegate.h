//
//  imacistranoAppDelegate.h
//  imacistrano
//
//  Created by Pom on 28.09.08.
//  Copyright agelion 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface imacistranoAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

