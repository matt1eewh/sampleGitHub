//
//  ScheduleCalculator.m
//  Transportation2
//
//  Created by XcodeDev on 7/11/14.
//  Copyright (c) 2014 XcodeDev. All rights reserved.
//

#import "ScheduleCalculator.h"
#import "Schedule.h"
#import "ScheduleModel.h"

@interface ScheduleCalculator()
{
    NSDateComponents *_dateComponent;
    NSDateComponents *_previousDateComponent;
    NSDate *_previousSchedule;
}

@end


@implementation ScheduleCalculator

-(NSDate *)getNextSchedule:(NSDate *)currentTime byRouteNumber:(NSString *)askedRouteNumber{
    
    // get the full schedule
    NSMutableDictionary *model = [[ScheduleModel new] getRoutesDetails];
    Schedule *selectedRouteDetails = model[askedRouteNumber];
    NSArray *departureTimeList = selectedRouteDetails.departureTimeAt;
    
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"HH:mm";
    _dateComponent = [NSDateComponents new];
    NSDate *nextSchedule = [NSDate new];
    
    /* 1
     //hard code schedule
     NSString *array = _busSchedule[7];
     NSString *hour = [array componentsSeparatedByString:@":"][0];
     NSString *minute = [array componentsSeparatedByString:@":"][1];
     _dateComponent.hour = [hour integerValue];
     _dateComponent.minute = [minute integerValue];
     NSDate *timeToCheck = [gregorian dateFromComponents:_dateComponent ];
     NSLog(@"%@ %@", hour, minute);
     _nextBusSchedule = [currentTime laterDate:timeToCheck];
     1 */
    
    
    int i = 0;
    BOOL isLater = false;
    do {
        // array should be sorted ascending order, get schedule from time table
        NSString *tempTimeSchedule = departureTimeList[i];

        // read the schedule time from array
        NSString *hour = [tempTimeSchedule componentsSeparatedByString:@":"][0];
        NSString *minute = [tempTimeSchedule componentsSeparatedByString:@":"][1];
        _dateComponent.hour = [hour integerValue];
        _dateComponent.minute = [minute integerValue];
        NSDate *timeToCheck = [gregorian dateFromComponents:_dateComponent ];
  

        // compare the selected schedule is very next to current time
        nextSchedule = [currentTime laterDate:timeToCheck];

        // unused, preserved for previous schedule
        if ([timeToCheck isEqualToDate:nextSchedule]) {
            isLater = true;
            
            // get previous schedule
            _previousDateComponent = [NSDateComponents new];
            int h = (i == 0)? departureTimeList.count -1 : i - 1;
            NSString *array = departureTimeList[h];
            NSString *hour = [array componentsSeparatedByString:@":"][0];
            NSString *minute = [array componentsSeparatedByString:@":"][1];
            _previousDateComponent.hour = [hour integerValue];
            _previousDateComponent.minute = [minute integerValue];
            _previousSchedule = [gregorian dateFromComponents:_previousDateComponent];
        }
        i++;
        
    } while (isLater == false);
    
    
//    NSLog(@"NexBusSchedule: %@",nextSchedule);
    
    return nextSchedule;

    
}

@end
