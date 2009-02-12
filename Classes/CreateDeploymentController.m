//
//  StageViewController.m
//  imacistrano
//
//  Created by Pom on 05.02.09.
//  Copyright 2009 agelion. All rights reserved.
//

#import "CreateDeploymentController.h"
#import "Deployment.h"
#import "DeploymentViewController.h"

@interface CreateDeploymentController (PrivateInterface)
-(void)switchToDeploymentView:(Deployment*)deployment;
@end

@implementation CreateDeploymentController
@synthesize stage, tasks;

- (void)viewDidLoad {
  [super viewDidLoad];
  [descriptionField becomeFirstResponder];
  [self setTitle:[stage name]];
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)runDeployment:(id)sender {
  [spinner startAnimating];
  [NSThread sleepForTimeInterval:0.5];
  Deployment *deployment = [[[Deployment alloc] init] autorelease];
  [deployment setDescription:[descriptionField text]];
  [deployment setTask:[[tasks objectAtIndex:[pickerView selectedRowInComponent:0]] name]];
  [deployment setStage:[self stage]];
  [deployment createRemoteWithParameters:[NSDictionary dictionaryWithObjectsAndKeys:
                                          stage.projectId, @"projectId", stage.stageId,
                                          @"stageId", nil]];
  deployment = [Deployment latest:[stage dumpKeys]];
  while (deployment == nil) {
    deployment = [Deployment latest:[stage dumpKeys]];
  }
  [spinner stopAnimating];
  [self switchToDeploymentView:deployment];
}

- (void)dealloc {
  [super dealloc];
}

- (void)switchToDeploymentView:(Deployment*)deployment {
  DeploymentViewController *deploymentViewController =
    [[DeploymentViewController alloc] initWithNibName:@"DeploymentViewController"
                                               bundle:nil];
  [deploymentViewController setDeployment:deployment];
  [self.navigationController pushViewController:deploymentViewController animated:YES];
  NSArray *vcs = [self.navigationController viewControllers];
  NSMutableArray *newVcs = [NSMutableArray arrayWithArray:
                            [vcs subarrayWithRange:NSMakeRange(0, ([vcs count] - 2))]];
  [newVcs addObject:[vcs objectAtIndex:([vcs count] - 1)]];
  [self.navigationController setViewControllers:newVcs];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
  return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
  return [tasks count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
  return [[tasks objectAtIndex:row] name]; 
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
  [descriptionField resignFirstResponder];
  return YES;
} 

@end
