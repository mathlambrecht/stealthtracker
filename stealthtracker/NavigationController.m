//
//  NavigationController.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 31/07/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        self.appModel = [AppModel getInstance];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isLoggedInChangedHandler:) name:@"IS_LOGGEDIN_CHANGED" object:nil];
        
        [self isLoggedInChangedHandler:nil];
    }
    return self;
}

//Check if user is logged in.
-(void)isLoggedInChangedHandler:(id)sender
{
    if([[AppModel getInstance] isLoggedIn])
    {
        self.dashboardViewController = [[DashboardViewController alloc] initWithNibName:nil bundle:nil];
        [self pushViewController:self.dashboardViewController animated:YES];
    }
    else
    {
        self.loginViewController = [[LoginViewController alloc] initWithNibName:nil bundle:nil];
        [self pushViewController:self.loginViewController animated:YES];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Do any additional setup after loading the view.
    
    //Setup navigation bar appearance
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.02 green:0.09 blue:0.12 alpha:1]];
    
    if([self.appModel isLoggedIn])
    {
        [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"bgNavBar.png"] forBarMetrics:UIBarMetricsDefault];
    }
    else
    {
        [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
        [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    }
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
