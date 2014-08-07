//
//  NewTrackingView.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 07/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "NewTrackingView.h"

@implementation NewTrackingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:0.02 green:0.09 blue:0.12 alpha:1];
        
        UIImage *bgBtnStart = [UIImage imageNamed:@"btnStart.png"];
        
        self.btnStart = [[Button alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - bgBtnStart.size.width/2, [UIScreen mainScreen].bounds.size.height/2 - bgBtnStart.size.height/2, bgBtnStart.size.width, bgBtnStart.size.height) andString:@"Start"];
        [self.btnStart setBackgroundImage:bgBtnStart forState:UIControlStateNormal];
        [self addSubview:self.btnStart];
    }
    return self;
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
