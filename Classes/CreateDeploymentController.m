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
  Deployment *deployment = [[Deployment alloc] init];
  [deployment setDescription:[descriptionField text]];
  [deployment setTask:[[tasks objectAtIndex:[pickerView selectedRowInComponent:0]] name]];
  [deployment setStage:stage];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deploymentDidLoad:) name:@"deploymentDidLoad" object:nil];
  [deployment runCreate];
}

- (void)dealloc {
  [super dealloc];
}

- (void)deploymentDidLoad:(id)notification {
  Deployment *deployment = [notification object];
  [spinner stopAnimating];
  NSLog(@"Firing off deployment view from %@", [NSThread currentThread]);
  [self switchToDeploymentView:deployment];
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
