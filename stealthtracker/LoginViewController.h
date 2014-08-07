//
//  LoginViewController.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 01/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginView.h"
#import "AppModel.h"

@interface LoginViewController : UIViewController

@property(strong, nonatomic) AppModel *appModel;
@property(strong, nonatomic) LoginView *view;

@end
