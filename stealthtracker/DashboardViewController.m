//
//  DashboardViewController.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 31/07/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "DashboardViewController.h"

@interface DashboardViewController ()

@end

@implementation DashboardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        
        //Create navbar
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btnMenu.png"] style:UIBarButtonItemStylePlain target:self action:@selector(btnMenuClicked:)];
        [self.navigationItem.leftBarButtonItem setTintColor: [UIColor colorWithRed:0.73 green:0.8 blue:0.82 alpha:1]];
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btnNewTracking.png"] style:UIBarButtonItemStylePlain target:self action:@selector(btnNewTrackingClicked:)];
        [self.navigationItem.rightBarButtonItem setTintColor: [UIColor colorWithRed:0.83 green:0.19 blue:0.19 alpha:1]];
        
        
    }
    return self;
}

-(void)btnMenuClicked:(id)sender
{
    
}

-(void)btnNewTrackingClicked:(id)sender
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[DashboardView alloc] initWithFrame:bounds];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
