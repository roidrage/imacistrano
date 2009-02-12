//
//  StageViewController.m
//  imacistrano
//
//  Created by Pom on 05.02.09.
//  Copyright 2009 agelion. All rights reserved.
//

#import "CreateDeploymentController.h"
#import "Deployment.h"

@implementation CreateDeploymentController
@synthesize stage, tasks;

- (void)viewDidLoad {
  [super viewDidLoad];
  NSLog(@"%@, %@", stage.projectId, stage.stageId); 
  [descriptionField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)runDeployment:(id)sender {
  Deployment *deployment = [[[Deployment alloc] init] autorelease];
  deployment.description = [descriptionField text];
  deployment.task = [[tasks objectAtIndex:[pickerView selectedRowInComponent:0]] name];
  [deployment createRemoteWithParameters:[NSDictionary dictionaryWithObjectsAndKeys:stage.projectId, @"projectId", stage.stageId, @"stageId", nil]];
}

- (void)dealloc {
  [super dealloc];
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
