//
//  TimeCalculator.m
//  Transportation2
//
//  Created by XcodeDev on 7/11/14.
//  Copyright (c) 2014 XcodeDev. All rights reserved.
//

#import "TimeCalculator.h"

@implementation TimeCalculator

+(NSDate*)getCurrentTime{
    NSLog(@"\n");
    NSLog(@"%@ ---------------------", NSStringFromSelector(_cmd));
    NSLog(@"\n");
    
    NSDate *currentTime;
    NSDate *now = [NSDate date];
    NSCalendar *gergorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *timeComponent = [gergorian components:(NSHourCalendarUnit | NSMinuteCalendarUnit) fromDate:now];
    
    /* //debug getCurrentTime
     NSInteger hour = timeComponent.hour;
     NSInteger minute = timeComponent.minute;
     NSLog(@"timeComponent: %i:%i",hour, minute);
     //debug getCurrentTime */
    
    currentTime = [gergorian dateFromComponents:timeComponent];
    
    return currentTime;
    
    
}

-(NSDateFormatter*)formatTimeHHmm{
    NSDateFormatter * timeFormatterMMss = [NSDateFormatter new];
    timeFormatterMMss.dateFormat = @"HH:mm";
    
    return timeFormatterMMss;
}

-(NSDateComponents*)getTimeDifference:(NSDate*)start andSchedule:(NSDate*)end{
    NSLog(@"\n");
    NSLog(@"%@ ---------------------", NSStringFromSelector(_cmd));
    NSLog(@"\n");
    
    //calculate time difference
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags = NSMonthCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit ;
    NSDateComponents *components = [gregorian components:unitFlags fromDate:start toDate:end options:0];
    
    /* //debug getTimeDifference:andSchedule:
     NSLog(@"hour left: %i",[components hour]);
     NSLog(@"minutes left: %i",[components minute]);
     //debug getTimeDifference:andSchedule: */
    
    return components;
}

@end
