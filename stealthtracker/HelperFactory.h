//
//  HelperFactory.h
//  stealthtracker
//
//  Created by Mathias Lambrecht on 01/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HelperFactory : NSObject

+(NSMutableAttributedString *)createAttributedString:(NSString *)string;
+(UILabel *)createNavbarTitle:(NSString *)string;

@end