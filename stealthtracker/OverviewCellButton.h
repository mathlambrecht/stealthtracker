//
//  OverviewCellButton.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 19/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SkirmDO.h"
#import "Polygon.h"
#import "Label.h"

@interface OverviewCellButton : UIButton

@property(strong, nonatomic) SkirmDO *skirmDO;

-(id)initWitSkirmDO:(SkirmDO *)skirmDO;

@end
