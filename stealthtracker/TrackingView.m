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
    self.polyTimer = [[Polygon alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/4 - image.size.width/4, 45, image.size.width, image.size.height) polygon:image value:0 label:@"skirm time"];
    self.polyTimer.lblValue.text = @"00:00:00";
    [self addSubview:self.polyTimer];
}

-(void)createOptions
{
    //Pause
    UIImage *bgBtnPause = [UIImage imageNamed:@"btnPause.png"];
    self.btnPause = [[Button alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - bgBtnPause.size.width/2, 20, bgBtnPause.size.width, bgBtnPause.size.height) andString:@""];
    [self.btnPause setBackgroundImage:bgBtnPause forState:UIControlStateNormal];
    self.btnPause.alpha = 0.2;
    
    //Resume
    UIImage *bgBtnResume = [UIImage imageNamed:@"btnContinue.png"];
    self.btnResume = [[Button alloc] initWithFrame:CGRectMake(20, 34, bgBtnResume.size.width, bgBtnResume.size.height) andString:@""];
    [self.btnResume setBackgroundImage:bgBtnResume forState:UIControlStateNormal];
    self.btnResume.alpha = 0;
    
    //End
    UIImage *bgBtnEnd = [UIImage imageNamed:@"btnEnd.png"];
    self.btnEnd = [[Button alloc] initWithFrame:CGRectMake(self.btnResume.frame.origin.x + bgBtnResume.size.width + 10, self.btnResume.frame.origin.y, bgBtnEnd.size.width, bgBtnEnd.size.height) andString:@"End"];
    [self.btnEnd setBackgroundImage:bgBtnEnd forState:UIControlStateNormal];
    self.btnEnd.alpha = 0;
    
    //Line
    self.lineCA = [CALayer layer];
    [self.layer addSublayer:self.lineCA];
    CGPoint pointA = CGPointMake(self.btnEnd.frame.origin.x + self.btnEnd.frame.size.width, self.btnEnd.center.y);
    CGPoint pointB = CGPointMake([UIScreen mainScreen].bounds.size.width - 20, pointA.y);
    self.lineCA.opacity = 0;
    
    CAShapeLayer *line = [CAShapeLayer layer];
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:pointA];
    [linePath addLineToPoint:pointB];
    line.path = linePath.CGPath;
    line.fillColor = nil;
    line.opacity = 1;
    line.lineWidth = 2;
    line.strokeColor = [UIColor colorWithRed:0.83 green:0.19 blue:0.19 alpha:1].CGColor;
    [self.lineCA addSublayer:line];
    
    [self showOptions:false];
    
    [self addSubview:self.btnPause];
    [self addSubview:self.btnResume];
    [self addSubview:self.btnEnd];
}

-(void)createHUD
{
    //Decibel
    self.decibelHUD = [[DecibelHUD alloc] initWithFrame:CGRectMake(0, 30, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self addSubview:self.decibelHUD];
    
    //Lux
    self.luxHud = [[LuxHUD alloc] initWithFrame:CGRectMake(0, 30, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self addSubview:self.luxHud];
}

-(void)createKillDeath
{
    self.killDeathRatioView = [[KillDeathRatioView alloc] initWithFrame:CGRectMake(20, 485, [UIScreen mainScreen].bounds.size.width, 100) andIsTrackingScreen:true andKills:0 andDeaths:0];
    [self addSubview:self.killDeathRatioView];
}

-(void)showOptions:(BOOL)isPaused
{
    if(isPaused)
    {
        //show end/resume options
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^
        {
            self.btnPause.alpha = 0;
            self.btnResume.alpha = 1;
            self.btnEnd.alpha = 1;
            self.lineCA.opacity = 1;
            
            self.polyTimer.alpha = 0.2;
            self.decibelHUD.alpha = 0.2;
            self.luxHud.alpha = 0.2;
            self.killDeathRatioView.alpha = 0.2;
        }
        completion:nil];
    }
    else
    {
        //show pause button
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^
         {
             self.btnPause.alpha = 0.3;
             self.btnResume.alpha = 0;
             self.btnEnd.alpha = 0;
            self.lineCA.opacity = 0;
             
             self.polyTimer.alpha = 1;
             self.decibelHUD.alpha = 1;
             self.luxHud.alpha = 1;
             self.killDeathRatioView.alpha = 1;
         }
        completion:nil];
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
