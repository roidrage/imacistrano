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

@interface ProjectsViewController (PrivateInterface)
-(void)loadPrefs;
-(BOOL)checkPrefs;
@end

@implementation ProjectsViewController
@synthesize password, username, hostUrl;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [projects count];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
  }
    
  Project *project = [projects objectAtIndex:indexPath.row];
  cell.text = project.name;
  return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  NSArray *stages = [[projects objectAtIndex:indexPath.row] findAllStages];
  StagesViewController * aStageViewController = [[StagesViewController alloc] initWithNibName:@"StagesViewController" bundle:nil];
  [aStageViewController setProject: [projects objectAtIndex:indexPath.row]];
  [aStageViewController setStages: stages];
  [self.navigationController pushViewController:aStageViewController animated:YES];
  [aStageViewController release];  
}

- (void)viewDidLoad {
  [self loadPrefs];
  if ([self checkPrefs] == YES) {
    [ObjectiveResourceConfig setSite:hostUrl];
    [ObjectiveResourceConfig setUser:username];
    [ObjectiveResourceConfig setPassword:password];
    projects = [Project findAllRemote];
    [projects retain];
  }
  self.title = @"Projects";
  [super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)dealloc {
  [super dealloc];
}

- (void)loadPrefs {
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  hostUrl = [defaults stringForKey:@"HostUrl"];
  username = [defaults stringForKey:@"Username"];
  password = [defaults stringForKey:@"Password"];
}

- (BOOL)checkPrefs {
  if (hostUrl == nil || [hostUrl length] == 0) {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Configuration Error" message:@"You don't have a host name configured. Please use the Settings to specify one." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [alert release];
    return NO;
  }
  
  if (username == nil || [username length] == 0) {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Configuration Error" message:@"You don't have a username configured. Please use the Settings to specify one." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    [alert release];
    return NO;
    
  }
  
  return YES;
}
@end

