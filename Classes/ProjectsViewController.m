//
//  RootViewController.m
//  imacistrano
//
//  Created by Pom on 28.09.08.
//  Copyright agelion 2008. All rights reserved.
//

#import "ProjectsViewController.h"
#import "imacistranoAppDelegate.h"
#import "Project.h"
#import "Stage.h"
#import "StagesViewController.h"

@implementation ProjectsViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [projects count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    Project *project = [projects objectAtIndex:indexPath.row];
    cell.text = project.name;
    // Set up the cell
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSArray *stages = [[projects objectAtIndex:indexPath.row] findAllStages];
  StagesViewController * aStageViewController = [[StagesViewController alloc] initWithNibName:@"StagesViewController" bundle:nil];
  aStageViewController.project = [projects objectAtIndex:indexPath.row];
  aStageViewController.stages = stages;
  [self.navigationController pushViewController:aStageViewController animated:YES];
  [aStageViewController release];  
}

- (void)viewDidLoad {
  [ObjectiveResourceConfig setSite:@"http://webistrano.local/"];
  [ObjectiveResourceConfig setUser:@"admin"];
  [ObjectiveResourceConfig setPassword:@"admin"];
  projects = [Project findAllRemote];
  self.title = @"Projects";

  [projects retain];
  [super viewDidLoad];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}


@end

