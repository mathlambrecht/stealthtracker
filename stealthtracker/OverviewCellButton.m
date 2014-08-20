//
//  OverviewCellButton.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 19/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "OverviewCellButton.h"

@implementation OverviewCellButton
Polygon *polyResult;
Label *lblDate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        // Initialization code
        UIImage *bgResult = [UIImage imageNamed:@"polyCellResult.png"];
        polyResult = [[Polygon alloc] initWithFrame:CGRectMake(8, 5.5, bgResult.size.width, bgResult.size.height) polygon:bgResult value:0 label:@""];
        polyResult.lblValue.textColor = [UIColor colorWithRed:0.91 green:0.21 blue:0.2 alpha:1];
        
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
        
        lblDate = [[Label alloc] initWithFrame:CGRectMake(80, 17, 120, 20) andString:[dateFormatter stringFromDate:self.skirmDO.date]];
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

//-(void)setHighlighted:(BOOL)highlighted
//{
//    [super setHighlighted:highlighted];
//    
//    if (highlighted)
//    {
//        polyResult.alpha = 0.5;
//        lblDate.alpha = 0.5;
//    }
//    else
//    {
//        polyResult.alpha = 1;
//        lblDate.alpha = 1;
//    }
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
