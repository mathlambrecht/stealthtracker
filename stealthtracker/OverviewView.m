//
//  OverviewView.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 19/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "OverviewView.h"

@implementation OverviewView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        // Initialization code
        self.backgroundColor = [UIColor colorWithRed:0.02 green:0.09 blue:0.12 alpha:1];
        
        self.arrListItems = [[NSMutableArray alloc] init];
        
        [self createCells];
    }
    
    return self;
}

-(void)createCells
{
    float xPos = 160;
    float yPos = 47;
    
    for(SkirmDO *skirmDO in [[AppModel getInstance] arrSkirms])
    {
        OverviewCellButton *cellButton = [[OverviewCellButton alloc] initWitSkirmDO:skirmDO];
        cellButton.center = CGPointMake(xPos, yPos);
        [self addSubview:cellButton];
        
        yPos = yPos + cellButton.frame.size.height + 20;
        
        [self.arrListItems addObject:cellButton];
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
