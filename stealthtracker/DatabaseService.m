//
//  DatabaseService.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 07/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "DatabaseService.h"

@implementation DatabaseService

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

-(void)saveNewSkirm
{
    
}

@end
