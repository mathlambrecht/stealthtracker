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
        self.dbService = [[DatabaseService alloc] init];
        
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
    bool isCorrectemail = [self NSStringIsValidEmail:self.view.txtEmail.text];
    bool isCorrectPassword = [self isCorrectPassword:self.view.txtPassword.text];
    
    //check email
    if([self NSStringIsValidEmail:self.view.txtEmail.text])
    {
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^
        {
            self.view.lblEmail.alpha = 1;
            self.view.lblWrongEmail.alpha = 0;
        }
        completion:nil];
    }
    else
    {
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^
        {
             self.view.lblEmail.alpha = 0;
             self.view.lblWrongEmail.alpha = 1;
        }
        completion:nil];
    }
    
    //checkpassword
    if([self isCorrectPassword:self.view.txtPassword.text])
    {
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^
        {
            self.view.lblPassword.alpha = 1;
            self.view.lblWrongPassword.alpha = 0;
        }
        completion:nil];
    }
    else
    {
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^
        {
            self.view.lblPassword.alpha = 0;
            self.view.lblWrongPassword.alpha = 1;
        }
        completion:nil];
    }
    
    //login
    if(isCorrectemail && isCorrectPassword)
    {
        [self.dbService loginWithEmail:self.view.txtEmail.text andPassword:self.view.txtPassword.text];
    }
}

-(BOOL) isCorrectPassword:(NSString *)checkString
{
    if([checkString length] < 3)
    {
        return false;
    }
    
    return true;
}

-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
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
    
    self.view.txtEmail.delegate = self;
    self.view.txtPassword.delegate = self;
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
