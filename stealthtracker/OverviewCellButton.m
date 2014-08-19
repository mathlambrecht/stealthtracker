//
//  OverviewCellButton.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 19/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "OverviewCellButton.h"

@implementation OverviewCellButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        // Initialization code
        UIImage *bgResult = [UIImage imageNamed:@"polyCellResult.png"];
        Polygon *polyResult = [[Polygon alloc] initWithFrame:CGRectMake(8, 5.5, bgResult.size.width, bgResult.size.height) polygon:bgResult value:0 label:@""];
        
        if(self.skirmDO.result == 1)
        {
            polyResult.lblValue.text = @"w";
        }
        else if(self.skirmDO.result == 0)
        {
            polyResult.lblValue.text = @"l";
        }
        
        [self addSubview:polyResult];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"dd/MM/yyyy";
        
        Label *lblDate = [[Label alloc] initWithFrame:CGRectMake(80, 17, 120, 20) andString:[dateFormatter stringFromDate:self.skirmDO.date]];
        [self addSubview:lblDate];
    }
    
    return self;
}

-(id)initWitSkirmDO:(SkirmDO *)skirmDO
{
    self.skirmDO = skirmDO;
    
    UIImage *bg = [UIImage imageNamed:@"polyOverview.png"];
    CGRect frame =  CGRectMake(0, 0, bg.size.width, bg.size.height);
    [self setBackgroundImage:bg forState:UIControlStateNormal];
    
    return [self initWithFrame:frame];
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
