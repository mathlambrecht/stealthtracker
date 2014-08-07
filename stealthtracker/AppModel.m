//
//  AppModel.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 01/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "AppModel.h"

@implementation AppModel

@synthesize isLoggedIn = _isLoggedIn;
@synthesize username = _username;


//Singleton - Init
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

-(id)init
{
    if(self = [super init])
    {
        _isLoggedIn = false;
    }
    
    return self;
}

//Functions
-(void)navigateToScreen:(NSString *)screen
{
    if ([screen isEqualToString:@"NEWTRACKING"])
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"NAVIGATE_TO_NEWTRACKING" object:self];
    }
}


//Getters - Setters
-(void)setIsLoggedIn:(BOOL)isLoggedIn
{
    if(_isLoggedIn != isLoggedIn)
    {
        _isLoggedIn = isLoggedIn;
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"IS_LOGGEDIN_CHANGED" object:self];
    }
}

-(BOOL)isLoggedIn
{
    return _isLoggedIn;
}

-(void)setUsername:(NSString *)username
{
    _username = username;
}

-(NSString *)username
{
    return _username;
}



@end
