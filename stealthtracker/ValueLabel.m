//
//  ValueLabel.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 08/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "ValueLabel.h"

@implementation ValueLabel

- (id)initWithFrame:(CGRect)frame value:(int)integer
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        self.font = [UIFont fontWithName:@"Arame-Thin" size:20];
        self.textColor = [UIColor colorWithRed:0.73 green:0.8 blue:0.82 alpha:1];
        NSString *string = [NSString stringWithFormat:@"%d", integer];
        self.attributedText = [HelperFactory createAttributedString:string];
        self.textAlignment = NSTextAlignmentCenter;
        self.adjustsFontSizeToFitWidth = YES;
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
