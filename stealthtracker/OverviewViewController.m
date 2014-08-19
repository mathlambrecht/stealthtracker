//
//  OverviewViewController.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 19/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "OverviewViewController.h"

@interface OverviewViewController ()

@end

@implementation OverviewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
        
        //Create navbar
        UIButton *btnBack = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 6, 19)];
        UIImage *btnBackImage = [UIImage imageNamed:@"btnBack.png"];
        [btnBack setBackgroundImage:btnBackImage  forState:UIControlStateNormal];
        [btnBack addTarget:self action:@selector(btnBackClickedHandler) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *btnBackItem = [[UIBarButtonItem alloc] initWithCustomView:btnBack];
        self.navigationItem.leftBarButtonItem = btnBackItem;
        
        self.navigationItem.titleView = [HelperFactory createNavbarTitle:@"Skirms"];
    }
    return self;
}

-(void)btnBackClickedHandler
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.view = [[OverviewView alloc] initWithFrame:bounds];
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
