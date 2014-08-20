//
//  LoginView.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 01/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HelperFactory.h"
#include "Label.h"
#import "InputTextField.h"
#import "Button.h"

@interface LoginView : UIView

@property (nonatomic, strong) Label *lblEmail;
@property (nonatomic, strong) Label *lblPassword;
@property (nonatomic, strong) InputTextField *txtEmail;
@property (nonatomic, strong) InputTextField *txtPassword;
@property (nonatomic, strong) Button *btnRegister;
@property (nonatomic, strong) Button *btnLogin;

@property(nonatomic, strong) Label *lblWrongEmail;
@property(nonatomic, strong) Label *lblWrongPassword;

@end
