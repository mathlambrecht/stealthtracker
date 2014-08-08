//
//  DOFactory.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 08/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "DOFactory.h"

@implementation DOFactory

+(SkirmDO *)createObjectFromDict:(NSDictionary *)dict
{
    SkirmDO *skirmDO = [SkirmDO alloc];
    skirmDO.userId = [[dict objectForKey:@"user_id"] intValue];
    skirmDO.result = [[dict objectForKey:@"result"] intValue];
    return skirmDO;
}

@end
