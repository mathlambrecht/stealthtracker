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
        
        self.appModel = [AppModel getInstance];
        
        self.navigationItem.titleView = [HelperFactory createNavbarTitle:@"Skirms"];
        
        self.arrListItemButtons = [[NSMutableArray alloc] init];
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
    
    float sizeOfContent = 0;
    UIView *lLast = [self.view.subviews lastObject];
    NSInteger wd = lLast.frame.origin.y;
    NSInteger ht = lLast.frame.size.height + 20;
    sizeOfContent = wd+ht;
    self.view.contentSize = CGSizeMake(self.view.frame.size.width, sizeOfContent);
    
    int i = 0;
    for(OverviewCellButton *listItem in self.view.arrListItems)
    {
        [listItem addTarget:self action:@selector(listItemClickedHandler:) forControlEvents:UIControlEventTouchUpInside];
        [listItem setTag:i];
        
        i = i + 1;
    }
}

-(void)listItemClickedHandler:(OverviewCellButton *)sender
{
    SkirmDO *skirmDO = [[SkirmDO alloc] init];
    skirmDO.arrDB = [[NSMutableArray alloc] init];
    skirmDO.arrLux = [[NSMutableArray alloc] init];
    
    skirmDO = [self.appModel.arrSkirms objectAtIndex:sender.tag];
    
    self.appModel.time = skirmDO.time;
    self.appModel.arrDB = skirmDO.arrDB;
    self.appModel.arrLux = skirmDO.arrLux;
    self.appModel.kills = skirmDO.kills;
    self.appModel.deaths = skirmDO.deaths;
    self.appModel.result = skirmDO.result;
    self.appModel.date = skirmDO.date;
    
    SummaryViewController *summaryViewController = [[SummaryViewController alloc] initWithIsListItem:true];
    [self.navigationController pushViewController:summaryViewController animated:YES];
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
