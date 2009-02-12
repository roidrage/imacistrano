//
//  StagesViewController.m
//  imacistrano
//
//  Created by Pom on 05.02.09.
//  Copyright 2009 agelion. All rights reserved.
//

#import "StagesViewController.h"
#import "CreateDeploymentController.h"

@implementation StagesViewController
@synthesize project, stages;

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setTitle:project.name];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [stages count];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
  static NSString *CellIdentifier = @"Cell";
    
  UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
  }
    
	Stage *stage = [stages objectAtIndex:indexPath.row];
  cell.text = stage.name;

  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  CreateDeploymentController *aStageViewController = [[CreateDeploymentController alloc]
                                                      initWithNibName:@"CreateDeploymentController"
                                                      bundle:nil];
  [aStageViewController setStage:[stages objectAtIndex:indexPath.row]];
  [aStageViewController setTasks:[[stages objectAtIndex:indexPath.row] findAllTasks]];
  [self.navigationController pushViewController:aStageViewController animated:YES];
  [aStageViewController release];
}

- (void)dealloc {
    [super dealloc];
}


@end

