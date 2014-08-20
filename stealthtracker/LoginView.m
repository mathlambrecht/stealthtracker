//
//  LoginView.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 01/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:0.02 green:0.09 blue:0.12 alpha:1];
        [self createForm];
    }
    return self;
}

-(void)createForm
{
    self.lblEmail = [[Label alloc] initWithFrame:CGRectMake(40, 165, 70, 20) andString:@"Email"];
    [self addSubview:self.lblEmail];
    
    UIImage *bgInput = [UIImage imageNamed:@"formInput.png"];
    
    self.txtEmail = [[InputTextField alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - bgInput.size.width/2, self.lblEmail.frame.origin.y + self.lblEmail.frame.size.height + 5, bgInput.size.width, bgInput.size.height) andString:@"yo@semite.com"];
    self.txtEmail.background = bgInput;
    [self addSubview:self.txtEmail];
    
    self.lblPassword = [[Label alloc] initWithFrame:CGRectMake(20, self.txtEmail.frame.origin.y + self.txtEmail.frame.size.height + 20, 150, 20) andString:@"Password"];
    [self addSubview:self.lblPassword];
    
    self.txtPassword = [[InputTextField alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - bgInput.size.width/2, self.lblPassword.frame.origin.y + self.lblPassword.frame.size.height + 5, bgInput.size.width, bgInput.size.height) andString:@"password"];
    self.txtPassword.background = bgInput;
    self.txtPassword.secureTextEntry = YES;
    [self addSubview:self.txtPassword];
    
    UIImage *bgBtn = [UIImage imageNamed:@"formBtn.png"];
    
    self.btnRegister = [[Button alloc] initWithFrame:CGRectMake(101, self.txtPassword.frame.origin.y + self.txtPassword.frame.size.height + 30, bgBtn.size.width, bgBtn.size.height) andString:@"Register"];
    [self addSubview:self.btnRegister];

    self.btnLogin = [[Button alloc] initWithFrame:CGRectMake(self.btnRegister.frame.origin.x + self.btnRegister.frame.size.width + 10, self.btnRegister.frame.origin.y, bgBtn.size.width, bgBtn.size.height) andString:@"Login"];
    [self.btnLogin setBackgroundImage:bgBtn forState:UIControlStateNormal];
    [self addSubview:self.btnLogin];
    
    self.lblWrongEmail = [[Label alloc] initWithFrame:CGRectMake(40, 165, 170, 20) andString:@"Incorrect Email"];
    self.lblWrongEmail.textColor = [UIColor colorWithRed:0.83 green:0.19 blue:0.19 alpha:1];
    self.lblWrongEmail.alpha = 0;
    [self addSubview:self.lblWrongEmail];
    
    self.lblWrongPassword = [[Label alloc] initWithFrame:CGRectMake(-30, self.txtEmail.frame.origin.y + self.txtEmail.frame.size.height + 20, 350, 20) andString:@"Incorrect Password"];
    self.lblWrongPassword.textColor = [UIColor colorWithRed:0.83 green:0.19 blue:0.19 alpha:1];
    self.lblWrongPassword.alpha = 0;
    [self addSubview:self.lblWrongPassword];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
