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
        self.databaseService = [[DatabaseService alloc] init];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(isLoggedInChangedHandler:) name:@"IS_LOGGEDIN_CHANGED" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(skirmsLoadedHandler:) name:@"SKIRMS_LOADED" object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(arrSkirmsChangedHandler:) name:@"ARRSKIRMS_CHANGED" object:nil];
        
        [self isLoggedInChangedHandler:nil];
    }
    return self;
}

//Check if user is logged in.
-(void)isLoggedInChangedHandler:(id)sender
{
    if([[AppModel getInstance] isLoggedIn])
    {
        [self getSkirms];
    }
    else
    {
        self.loginViewController = [[LoginViewController alloc] initWithNibName:nil bundle:nil];
        [self pushViewController:self.loginViewController animated:YES];
    }
}

//Fetch data
-(void)getSkirms
{
    [self.databaseService getLocalSkirms];
}

//Set Model data
-(void)skirmsLoadedHandler:(id)sender
{
    self.appModel.arrSkirms = self.databaseService.arrSkirms;
}

//Show dashboard
-(void)arrSkirmsChangedHandler:(id)sender
{
    self.dashboardViewController = [[DashboardViewController alloc] initWithNibName:nil bundle:nil];
    [self pushViewController:self.dashboardViewController animated:YES];
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

@end
