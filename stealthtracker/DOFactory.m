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
    SkirmDO *skirmDO = [[SkirmDO alloc] init];
    skirmDO.userId = [[dict objectForKey:@"user_id"] intValue];
    skirmDO.result = [[dict objectForKey:@"result"] intValue];
    return skirmDO;
}

+(SkirmDO *)createLatestSkirm
{
    AppModel *appModel = [AppModel getInstance];
    
    SkirmDO *skirmDO = [[SkirmDO alloc] init];
    
    skirmDO.arrDB = [[NSMutableArray alloc] init];
    skirmDO.arrLux = [[NSMutableArray alloc] init];
    
    skirmDO.userId = [[appModel.dUser objectForKey:@"id"] intValue];
    skirmDO.time = appModel.time;
    skirmDO.arrDB = appModel.arrDB;
    skirmDO.arrLux = appModel.arrLux;
    skirmDO.kills = appModel.kills;
    skirmDO.deaths = appModel.deaths;
    skirmDO.result = appModel.result;
    skirmDO.date = [NSDate date];
    
    return skirmDO;
}

@end
