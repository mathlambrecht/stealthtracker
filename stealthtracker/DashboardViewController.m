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
        self.appModel = [AppModel getInstance];
        
        //Create navbar
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btnMenu.png"] style:UIBarButtonItemStylePlain target:self action:@selector(btnMenuClicked:)];
        [self.navigationItem.leftBarButtonItem setTintColor: [UIColor colorWithRed:0.73 green:0.8 blue:0.82 alpha:1]];
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btnNewTracking.png"] style:UIBarButtonItemStylePlain target:self action:@selector(btnNewTrackingClicked:)];
        [self.navigationItem.rightBarButtonItem setTintColor: [UIColor colorWithRed:0.83 green:0.19 blue:0.19 alpha:1]];
        
        self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logoNavBar.png"]];
        
        //Create dashboard
        [self createDashboard];
    }
    
    return self;
}

-(void)createDashboard
{
    //totalskirms
    int wins;
    int losses;
    
    for(SkirmDO *skirm in self.appModel.arrSkirms)
    {
        if(skirm.result == 1)
        {
            wins ++;
        }
        else if (skirm.result == 0)
        {
            losses ++;
        }
        
        NSLog(@"%i", skirm.result);
    }
}

-(void)btnMenuClicked:(id)sender
{
}

-(void)btnNewTrackingClicked:(id)sender
{
    NewTrackingViewController *newTrackingViewController = [[NewTrackingViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:newTrackingViewController animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bgNavBar.png"] forBarMetrics:UIBarMetricsDefault];
    
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[DashboardView alloc] initWithFrame:bounds];
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
