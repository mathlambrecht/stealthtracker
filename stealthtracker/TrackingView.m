//
//  TrackingView.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 07/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "TrackingView.h"

@implementation TrackingView

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
    UIImage *lineImage = [UIImage imageNamed:@"bgNavBar.png"];
    UIImageView *lineImageView = [[UIImageView alloc] initWithImage:lineImage];
    lineImageView.frame = CGRectMake(0, 25, lineImage.size.width, lineImage.size.height);
    [self addSubview:lineImageView];
    
    UIImage *bgBtnPause = [UIImage imageNamed:@"btnPause.png"];
    self.btnPause = [[Button alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - bgBtnPause.size.width/2, 15, bgBtnPause.size.width, bgBtnPause.size.height)];
    [self.btnPause setBackgroundImage:bgBtnPause forState:UIControlStateNormal];
    [self addSubview:self.btnPause];
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
