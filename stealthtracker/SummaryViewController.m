//
//  SummaryViewController.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 13/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "SummaryViewController.h"

@interface SummaryViewController ()

@end

@implementation SummaryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        self.appModel = [AppModel getInstance];
        self.dbService = [[DatabaseService alloc] init];
        
        if(!self.isListItem)
        {
            self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btnDiscard.png"] style:UIBarButtonItemStylePlain target:self action:@selector(btnDiscardClickedHandler:)];
            [self.navigationItem.leftBarButtonItem setTintColor: [UIColor colorWithRed:0.83 green:0.19 blue:0.19 alpha:1]];
            
            self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btnSave.png"] style:UIBarButtonItemStylePlain target:self action:@selector(btnSaveClickedHandler:)];
            [self.navigationItem.rightBarButtonItem setTintColor: [UIColor colorWithRed:0.83 green:0.19 blue:0.19 alpha:1]];
            
            self.navigationItem.titleView = [HelperFactory createNavbarTitle:@"Summary"];
            
            [self.view.btnResult addTarget:self action:@selector(btnResultClickedHandler:) forControlEvents:UIControlEventTouchUpInside];
        }
        else
        {
            UIButton *btnBack = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 6, 19)];
            UIImage *btnBackImage = [UIImage imageNamed:@"btnBack.png"];
            [btnBack setBackgroundImage:btnBackImage  forState:UIControlStateNormal];
            [btnBack addTarget:self action:@selector(btnBackClickedHandler) forControlEvents:UIControlEventTouchUpInside];
            UIBarButtonItem *btnBackItem = [[UIBarButtonItem alloc] initWithCustomView:btnBack];
            self.navigationItem.leftBarButtonItem = btnBackItem;
            
            self.navigationItem.titleView = [HelperFactory createNavbarTitle:@"This is a date"];
        }
    }
    
    return self;
}

-(void)createSummary
{
    //time
    int seconds = self.appModel.time;
    NSUInteger minutes  = seconds/60;
    NSUInteger hours = minutes/60;
    self.view.polyTimer.lblValue.text = [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes%60, seconds%60];
    
    //btnResult
    
    //HUD
    self.view.decibelHUD.dB = [HelperFactory calculateAverageDBBySkirm];
    self.view.luxHUD.lux = [HelperFactory calculateAverageLuxBySkirm];
    
    //KD Ratio
    self.view.kdRatio.kills = self.appModel.kills;
    self.view.kdRatio.deaths = self.appModel.deaths;
}

-(id)initWithIsListItem:(BOOL)isListItem
{
    self.isListItem = isListItem;
    
    return [self initWithNibName:nil bundle:nil];
}

-(void)btnResultClickedHandler:(id)sender
{
    NSLog(@"test");
}

-(void)btnSaveClickedHandler:(id)sender
{
    if([self.dbService saveSkirms])
    {        
        [self resetModel];
    }
    else
    {
        NSLog(@"[SummaryViewController] Skirms could not be saved. Tap discard to continue");
    }
}

-(void)btnDiscardClickedHandler:(id)sender
{
    [self resetModel];
}

-(void)resetModel
{
    self.appModel.time = 0;
    [self.appModel.arrDB removeAllObjects];
    [self.appModel.arrLux removeAllObjects];
    self.appModel.kills = 0;
    self.appModel.deaths = 0;
    
    [self.dbService getLocalSkirms];
}

-(void)btnBackClickedHandler
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)sessionSaved:(id)sender
{
    DashboardViewController *dashboardViewController = [[DashboardViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:dashboardViewController animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[SummaryView alloc] initWithFrame:bounds andIsListItem:self.isListItem];
    
    [self createSummary];
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
