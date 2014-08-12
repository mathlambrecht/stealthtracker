//
//  LuxHUD.m
//  stealthtracker
//
//  Created by Mathias Lambrecht on 12/08/14.
//  Copyright (c) 2014 Devine. All rights reserved.
//

#import "LuxHUD.h"
#include <IOKit/hid/IOHIDEventSystem.h>
#include <stdio.h>

@implementation LuxHUD

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
    }
    return self;
}

void handle_event (void* target, void* refcon, IOHIDServiceRef service, IOHIDEventRef event)
{
    if (IOHIDEventGetType(event)==kIOHIDEventTypeAmbientLightSensor)
    {
        // Ambient Light Sensor Event
        int luxValue=IOHIDEventGetIntegerValue(event, (IOHIDEventField)kIOHIDEventFieldAmbientLightSensorLevel); // lux Event Field
        int channel0=IOHIDEventGetIntegerValue(event, (IOHIDEventField)kIOHIDEventFieldAmbientLightSensorRawChannel0); // ch0 Event Field
        int channel1=IOHIDEventGetIntegerValue(event, (IOHIDEventField)kIOHIDEventFieldAmbientLightSensorRawChannel1); // ch1 Event Field
        
        NSLog(@"IOHID: ALS Sensor: Lux : %d  ch0 : %d   ch1 : %d",luxValue,channel0,channel1);
        // lux==0 : no light, lux==1000+ almost direct sunlight
    }
}

int main()
{
    // Create and open an event system.
    IOHIDEventSystemRef system = IOHIDEventSystemCreate(NULL);
    
    // Set the PrimaryUsagePage and PrimaryUsage for the Ambient Light Sensor Service
    int page = 0xff00;
    int usage = 4;
    
    // Create a dictionary to match the service with
    CFNumberRef nums[2];
    CFStringRef keys[2];
    keys[0] = CFStringCreateWithCString(0, "PrimaryUsagePage", 0);
    keys[1] = CFStringCreateWithCString(0, "PrimaryUsage", 0);
    nums[0] = CFNumberCreate(0, kCFNumberSInt32Type, &page);
    nums[1] = CFNumberCreate(0, kCFNumberSInt32Type, &usage);
    
    
    CFDictionaryRef dict = CFDictionaryCreate(0, (const void**)keys, (const void**)nums, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    
    // Get all services matching the above criteria
    CFArrayRef srvs = (CFArrayRef)IOHIDEventSystemCopyMatchingServices(system, dict, 0, 0, 0,0);
    
    
    // Get the service
    IOHIDServiceRef serv = (IOHIDServiceRef)CFArrayGetValueAtIndex(srvs, 0);
    int interval = 1 ;
    
    // set the ReportInterval of ALS service to something faster than the default (5428500)
    IOHIDServiceSetProperty((IOHIDServiceRef)serv, CFSTR("ReportInterval"), CFNumberCreate(0, kCFNumberSInt32Type, &interval));
    
    IOHIDEventSystemOpen(system, handle_event, NULL, NULL, NULL);
    printf("HID Event system should now be running. Hit enter to quit any time.\n");
    getchar();
    
    int defaultInterval=5428500;
    IOHIDServiceSetProperty((IOHIDServiceRef)serv, CFSTR("ReportInterval"), CFNumberCreate(0, kCFNumberSInt32Type, &defaultInterval));
    
    IOHIDEventSystemClose(system, NULL);
    CFRelease(system);
    return 0;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
