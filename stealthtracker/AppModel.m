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
@synthesize dUser = _dUser;


// ---------------------------------------- Singleton - Init ----------------------------------------
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
        
        _dUser = @{
                   @"id" : @"1",
                   @"username": @"mathlambrecht",
                   @"email": @"math.lambrecht@gmail.com"
                   };
        
        
    }
    
    return self;
}

// ---------------------------------------- Functions ----------------------------------------


// ---------------------------------------- Getters/Setters ----------------------------------------

//isLoggedIn
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


@end
