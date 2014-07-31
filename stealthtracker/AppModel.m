//
//  AppModel.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 01/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "AppModel.h"

@implementation AppModel

+(id)getInstance
{
    static AppModel *appModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
    {
        appModel = [[self alloc] init];
    });
    
    return appModel;
}

@end
