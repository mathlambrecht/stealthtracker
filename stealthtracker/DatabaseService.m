//
//  DatabaseService.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 07/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "DatabaseService.h"

@implementation DatabaseService
AppModel *appModel;

-(id)init
{
    self = [super init];
    
    if(self)
    {
        self.arrSkirms = [[NSMutableArray alloc] init];
        appModel = [AppModel getInstance];
    }
    
    return self;
}

-(void)loginWithEmail:(NSString *)email andPassword:(NSString *)password
{
    NSString *path = @"http://student.howest.be/mathias.lambrecht/20132014/MAIV/login";
    
    NSDictionary *params = @{
                             @"email": email,
                             @"password": password
                             };
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        NSLog(@"%@", operation.responseObject);
        
        appModel.dUser = @{
                                @"id" : @"1",
                                @"username": @"mathlambrecht",
                                @"email": @"math.lambrecht@gmail.com"
                                };
        
        appModel.isLoggedIn = true;
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        NSLog(@"Could not log in: %@", operation.error);
    }];
}

/*
-(void)getSkirmsByUserId:(NSString *)userId
{
    NSString *path = [NSString stringWithFormat:@"http://student.howest.be/mathias.lambrecht/20132014/MAIV/index.php/skirms/%@", userId];
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation start];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        self.arrSkirms = [[NSMutableArray alloc] init];
        
        for(NSDictionary *dict in operation.responseObject)
        {
            [self.arrSkirms addObject: [DOFactory createObjectFromDict:dict]];
        }
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"SKIRMS_LOADED" object:self];
    }
     
    failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        NSLog(@"%@", error);
    }];
}
 */

-(BOOL)saveSkirms
{
    self.arrSkirms = [[AppModel getInstance] arrSkirms];
    SkirmDO *skirmDO = [DOFactory createLatestSkirm];
    [self.arrSkirms addObject:skirmDO];
    
    NSString *path = [HelperFactory getArchivePath];
    
    BOOL success = [NSKeyedArchiver archiveRootObject:self.arrSkirms toFile:path];
    
    return success;
}

-(void)getLocalSkirms
{
    NSString *path = [HelperFactory getArchivePath];
    
    self.arrSkirms = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    if(self.arrSkirms == NULL)
    {
        self.arrSkirms = [[NSMutableArray alloc] init];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SKIRMS_LOADED" object:self];
}

@end
