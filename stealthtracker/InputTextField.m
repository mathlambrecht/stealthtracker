//
//  InputTextField.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 01/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "InputTextField.h"

@implementation InputTextField

- (id)initWithFrame:(CGRect)frame andString:(NSString *)string
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        self.font = [UIFont fontWithName:@"Arame-Thin" size:14];
        self.textColor = [UIColor colorWithRed:0.73 green:0.8 blue:0.82 alpha:1];
        self.attributedText = [HelperFactory createAttributedString:string];
    }
    
    return self;
}

- (CGRect)textRectForBounds:(CGRect)bounds;
{
    return CGRectInset(bounds, 20, 0);
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds, 20, 0);
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
