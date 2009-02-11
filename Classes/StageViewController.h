//
//  StageViewController.h
//  imacistrano
//
//  Created by Pom on 05.02.09.
//  Copyright 2009 agelion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Stage.h"

@interface StageViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate> {
  Stage *stage;
  NSArray *tasks;
  IBOutlet UIPickerView *pickerView;
  IBOutlet UITextField *descriptionField;
}

@property (retain, nonatomic) Stage *stage;
@property (retain, nonatomic) NSArray *tasks;

- (IBAction)runDeployment:(id)sender;

@end
