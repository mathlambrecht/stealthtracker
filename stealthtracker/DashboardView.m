//
//  DashboardView.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 31/07/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "DashboardView.h"

@implementation DashboardView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:0.02 green:0.09 blue:0.12 alpha:1];
        
        //create HUD
        [self createTopPolys];
    }
    return self;
}

-(void)createTopPolys
{
    UIImage *image = [UIImage imageNamed:@"polyDefault.png"];
    self.polyTotalSkirms = [[Polygon alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height) polygon:image value:10 label:@"skirms"];
    [self addSubview:self.polyTotalSkirms];
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
