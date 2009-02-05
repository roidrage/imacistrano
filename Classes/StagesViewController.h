//
//  StagesViewController.h
//  imacistrano
//
//  Created by Pom on 05.02.09.
//  Copyright 2009 agelion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Project.h"

@interface StagesViewController : UITableViewController {
  IBOutlet UITableView *tableView;
  Project * project;
  NSArray * stages;
}

@property (nonatomic, retain) Project * project;
@property (nonatomic, retain) NSArray * stages;
@end
