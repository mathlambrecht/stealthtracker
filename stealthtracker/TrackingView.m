//
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
        
        [self createScreen];
    }
    return self;
}

-(void)createScreen
{
//    UIImage *lineImage = [UIImage imageNamed:@"bgNavBar.png"];
//    UIImageView *lineImageView = [[UIImageView alloc] initWithImage:lineImage];
//    lineImageView.frame = CGRectMake(0, 25, lineImage.size.width, lineImage.size.height);
//    [self addSubview:lineImageView];
    
    UIImage *bgBtnPause = [UIImage imageNamed:@"btnPause.png"];
    self.btnPause = [[Button alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - bgBtnPause.size.width/2, 30, bgBtnPause.size.width, bgBtnPause.size.height)];
    [self.btnPause setBackgroundImage:bgBtnPause forState:UIControlStateNormal];
    [self addSubview:self.btnPause];
    
    UIImage *image = [UIImage imageNamed:@"polyTimer.png"];
    self.polyTimer = [[Polygon alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/4 - image.size.width/4, 50, image.size.width, image.size.height) polygon:image value:0 label:@"skrim time"];
    self.polyTimer.lblValue.text = @"00:00:00";
    [self addSubview:self.polyTimer];
    
    DecibelHUD *decibelHUD = [[DecibelHUD alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self addSubview:decibelHUD];
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
