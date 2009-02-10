//
//  RootViewController.h
//  imacistrano
//
//  Created by Pom on 28.09.08.
//  Copyright agelion 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProjectsViewController : UITableViewController {
  NSArray *projects;
  IBOutlet UITableView *tableView;
  NSString *hostUrl;
  NSString *username;
  NSString *password;
}

-(void)loadPrefs;
-(BOOL)checkPrefs;

@property (retain, nonatomic) NSString *hostUrl;
@property (retain, nonatomic) NSString *username;
@property (retain, nonatomic) NSString *password;
@end
