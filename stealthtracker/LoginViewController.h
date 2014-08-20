//
//  LoginViewController.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 01/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginView.h"
#import "DatabaseService.h"
#import "AppModel.h"

@interface LoginViewController : UIViewController<UITextFieldDelegate>

@property(strong, nonatomic) AppModel *appModel;
@property(strong, nonatomic) LoginView *view;
@property(strong, nonatomic) DatabaseService *dbService;

@end
