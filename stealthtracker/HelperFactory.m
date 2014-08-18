//
//  HelperFactory.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 01/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "HelperFactory.h"

@implementation HelperFactory

+(NSMutableAttributedString *)createAttributedString:(NSString *)string
{
    string = [string uppercaseString];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    [attributedString addAttribute:NSKernAttributeName value:@(2) range:NSMakeRange(0, [string length])];
    
    return attributedString;
}

+(UILabel *)createNavbarTitle:(NSString *)string
{
    UILabel *lbl = [UILabel new];
    lbl.attributedText = [self createAttributedString:string];
    lbl.textColor = [UIColor colorWithRed:0.73 green:0.8 blue:0.82 alpha:1];
    lbl.font = [UIFont fontWithName:@"RODUScut300" size:16];
    [lbl sizeToFit];
    return lbl;
}

+(NSString *)getArchivePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    
    return [documentDirectory stringByAppendingPathComponent:@"stealthtracker.archive"];
}

+(float)calculateAverageDb
{
    float total = 0.0;
    int count = 0;
    
    for(SkirmDO *skirmDO in [[AppModel getInstance] arrSkirms])
    {
        for(NSNumber *number in skirmDO.arrDB)
        {
            total = total + [number floatValue];
        }
        
        count = count + [skirmDO.arrDB count];
    }
    
    return total/count;
}

+(float)calculateAverageLux
{
    float avg;
    return avg;
}

@end
