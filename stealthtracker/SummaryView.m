//
//  SummaryView.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 13/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "SummaryView.h"

@implementation SummaryView
@synthesize isListItem = _isListItem;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:0.02 green:0.09 blue:0.12 alpha:1];
        
        [self createDashboard];
    }
    
    return self;
}

-(id)initWithFrame:(CGRect)frame andIsListItem:(BOOL)isListItem
{
    _isListItem = isListItem;
    
    return [self initWithFrame:frame];
}

-(void)createDashboard
{
    UIImage *image = [UIImage imageNamed:@"polyTimer.png"];
    self.polyTimer = [[Polygon alloc] initWithFrame:CGRectMake(10, 15, image.size.width, image.size.height) polygon:image value:0 label:@"skirm time"];
    self.polyTimer.lblValue.text = @"";
    [self addSubview:self.polyTimer];
    
    if(_isListItem)
    {
        self.polyResult = [[Polygon alloc] initWithFrame:CGRectMake(87, 15.5, image.size.width, image.size.height) polygon:image value:0 label:@"result"];
        [self addSubview:self.polyResult];
    }
    else
    {
        self.btnResult = [[Button alloc] initWithFrame:CGRectMake(self.polyTimer.frame.origin.x + self.polyTimer.frame.size.width + 35, 30, image.size.width, image.size.height) andString:@"Win"];
        [self.btnResult setImage:image forState:UIControlStateNormal];
        [self addSubview:self.btnResult];
        
        self.lblResult = [[Label alloc] initWithFrame:CGRectMake(self.btnResult.center.x - 50, self.btnResult.frame.origin.y + self.btnResult.frame.size.height + 3, 100, 25) andString:@"Result"];
        [self addSubview:self.lblResult];
    }
    
    self.decibelHUD = [[DecibelHUD alloc] initWithFrame:CGRectMake(0, -30, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self addSubview:self.decibelHUD];
    self.decibelHUD.dB = -25;
    
    self.luxHUD = [[LuxHUD alloc] initWithFrame:CGRectMake(0, -30, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.luxHUD.lux = 0.5;
    [self addSubview:self.luxHUD];
    
    image = [UIImage imageNamed:@"polyDefault.png"];
    self.polyAvgDB = [[Polygon alloc] initWithFrame:CGRectMake(36, 115, image.size.width, image.size.height) polygon:image value:0 label:@"Avg. dB"];
    [self addSubview:self.polyAvgDB];
    
    self.polyAvgLux = [[Polygon alloc] initWithFrame:CGRectMake(self.polyAvgDB.frame.origin.x + self.polyAvgDB.frame.size.width - 7, self.polyAvgDB.frame.origin.y, image.size.width, image.size.height) polygon:image value:0 label:@"Avg. Lux"];
    [self addSubview:self.polyAvgLux];
    
    self.polyAvgDB.lblValue.text = [NSString stringWithFormat:@"%1.f", [HelperFactory calculateAverageDBBySkirm]];
    self.polyAvgLux.lblValue.text = [NSString stringWithFormat:@"%1.fk", [HelperFactory calculateAverageLuxBySkirm] * 1000];
    
    self.kdRatio = [[KillDeathRatioView alloc] initWithFrame:CGRectMake(20, 420, [UIScreen mainScreen].bounds.size.width, 100) andIsTrackingScreen:false andKills:0 andDeaths:0];
    [self addSubview:self.kdRatio];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
