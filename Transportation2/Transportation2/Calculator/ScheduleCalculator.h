//
//  ScheduleCalculator.h
//  Transportation2
//
//  Created by XcodeDev on 7/11/14.
//  Copyright (c) 2014 XcodeDev. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ScheduleCalculator : NSObject


-(NSDate *)getNextSchedule:(NSDate*)currentTime byRouteNumber:(NSString*)routeNumber;
@end
