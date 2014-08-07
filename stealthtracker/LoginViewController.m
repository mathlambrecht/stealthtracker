//
//  LoginViewController.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 01/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom
        self.appModel = [AppModel getInstance];
        
        //Appearance
        self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logoNavBar.png"]];
        
        //Add handlers
        [self.view.btnRegister addTarget:self action:@selector(btnRegisterClickHandler:) forControlEvents:UIControlEventTouchUpInside];
        [self.view.btnLogin addTarget:self action:@selector(btnLoginClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)btnRegisterClickHandler:(id)sender{}

-(void)btnLoginClickHandler:(id)sender
{
    self.appModel.isLoggedIn = true;
}


-(void)dissmissKeyboard
{
    [self.view endEditing:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[LoginView alloc] initWithFrame:bounds];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
