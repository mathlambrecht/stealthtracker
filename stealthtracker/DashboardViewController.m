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
        
        self.navigationItem.titleView = [HelperFactory createNavbarTitle:@"Dashboard"];
    }
    
    return self;
}

-(void)createDashboard
{
    //totalskirms
    int wins = 0;
    int losses = 0;
    
    for(SkirmDO *skirm in self.appModel.arrSkirms)
    {
        if(skirm.result == 1)
        {
            wins += 1;
        }
        else if (skirm.result == 0)
        {
            losses += 1;
        }
    }
    
    self.view.polyTotalSkirms.lblValue.text = [NSString stringWithFormat:@"%i", wins + losses];
    self.view.polyWins.lblValue.text = [NSString stringWithFormat:@"%i", wins];
    self.view.polyLosses.lblValue.text = [NSString stringWithFormat:@"%i", losses];
    
    //dB / Lux average HUD
    self.view.polyAvgDB.lblValue.text = [NSString stringWithFormat:@"%1.f", [HelperFactory calculateAverageDb]];
    self.view.polyAvgLux.lblValue.text = [NSString stringWithFormat:@"%1.f", [HelperFactory calculateAverageLux]];
}

-(void)btnMenuClicked:(id)sender
{
    OverviewViewController *overviewViewController = [[OverviewViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:overviewViewController animated:YES];
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
    
    CGRect bounds = [[UIScreen mainScreen] bounds];
    self.view = [[DashboardView alloc] initWithFrame:bounds andKills:[HelperFactory calculateTotalKills] andDeaths:[HelperFactory calculateTotalDeaths]];
    
    [self createDashboard];
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
