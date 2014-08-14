//  TrackingView.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 07/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "TrackingView.h"

@implementation TrackingView
@synthesize seconds = _seconds;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:0.02 green:0.09 blue:0.12 alpha:1];
        
        [self initTimer];
        [self createHUD];
        [self createKillDeath];
        [self createOptions];
    }
    return self;
}

-(void)initTimer
{
    //Timer
    UIImage *image = [UIImage imageNamed:@"polyTimer.png"];
    self.polyTimer = [[Polygon alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/4 - image.size.width/4, 40, image.size.width, image.size.height) polygon:image value:0 label:@"skirm time"];
    self.polyTimer.lblValue.text = @"00:00:00";
    [self addSubview:self.polyTimer];
}

-(void)createOptions
{
    //Pause
    UIImage *bgBtnPause = [UIImage imageNamed:@"btnPause.png"];
    self.btnPause = [[Button alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - bgBtnPause.size.width/2, 15, bgBtnPause.size.width, bgBtnPause.size.height) andString:@""];
    [self.btnPause setBackgroundImage:bgBtnPause forState:UIControlStateNormal];
    self.btnPause.alpha = 0.25;
    
    //Resume
    UIImage *bgBtnResume = [UIImage imageNamed:@"btnContinue.png"];
    self.btnResume = [[Button alloc] initWithFrame:CGRectMake(20, 27, bgBtnResume.size.width, bgBtnResume.size.height) andString:@""];
    [self.btnResume setBackgroundImage:bgBtnResume forState:UIControlStateNormal];
    
    //End
    UIImage *bgBtnEnd = [UIImage imageNamed:@"btnEnd.png"];
    self.btnEnd = [[Button alloc] initWithFrame:CGRectMake(self.btnResume.frame.origin.x + bgBtnResume.size.width + 10, self.btnResume.frame.origin.y, bgBtnEnd.size.width, bgBtnEnd.size.height) andString:@"End"];
    [self.btnEnd setBackgroundImage:bgBtnEnd forState:UIControlStateNormal];
    
    
    [self showOptions:false];
    
    [self addSubview:self.btnPause];
    [self addSubview:self.btnResume];
    [self addSubview:self.btnEnd];
}

-(void)createHUD
{
    //Decibel
    self.decibelHUD = [[DecibelHUD alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self addSubview:self.decibelHUD];
    
    //Lux
    self.luxHud = [[LuxHUD alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self addSubview:self.luxHud];
}

-(void)createKillDeath
{
    UIImage *image = [UIImage imageNamed:@"polyDefault.png"];
    self.btnKill = [[Button alloc] initWithFrame:CGRectMake(20, [UIScreen mainScreen].bounds.size.height - image.size.height - 40, image.size.width, image.size.height) andString:@"0"];
    [self.btnKill setBackgroundImage:image forState:UIControlStateNormal];
    [self addSubview:self.btnKill];
    
    self.lblKill = [[Label alloc] initWithFrame:CGRectMake(self.btnKill.frame.origin.x + self.btnKill.frame.size.width/2 - 50, self.btnKill.frame.origin.y + self.btnKill.frame.size.height + 5, 100, 30) andString:@"Kills"];
    [self addSubview:self.lblKill];
    
    self.btnDeath = [[Button alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - image.size.width - 20, [UIScreen mainScreen].bounds.size.height - image.size.height - 40, image.size.width, image.size.height) andString:@"0"];
    [self.btnDeath setBackgroundImage:image forState:UIControlStateNormal];
    [self addSubview:self.btnDeath];
    
    self.lblDeath = [[Label alloc] initWithFrame:CGRectMake(self.btnDeath.frame.origin.x + self.btnDeath.frame.size.width/2 - 50, self.btnDeath.frame.origin.y + self.btnDeath.frame.size.height + 5, 100, 30) andString:@"Deaths"];
    [self addSubview:self.lblDeath];
}

-(void)showOptions:(BOOL)isPaused
{
    if(isPaused)
    {
        //show end/resume options
        self.btnPause.hidden = true;
        self.btnResume.hidden = false;
        self.btnEnd.hidden = false;
    }
    else
    {
        //show pause button
        self.btnPause.hidden = false;
        self.btnResume.hidden = true;
        self.btnEnd.hidden = true;
    }
}

-(void)setSeconds:(int)seconds
{
    if(_seconds != seconds)
    {
        _seconds = seconds;
        
        NSUInteger minutes  = _seconds/60;
        NSUInteger hours = minutes/60;
        
        self.polyTimer.lblValue.text = [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes%60, _seconds%60];
    }
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
