//
//  TimeCalculator.h
//  Transportation2
//
//  Created by XcodeDev on 7/11/14.
//  Copyright (c) 2014 XcodeDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeCalculator : NSObject

@property (strong, nonatomic) NSData *currentTime;
@property (strong, nonatomic) NSDateComponents *timeFormatter;


+(NSDate *)getCurrentTime;
-(NSDateFormatter *)formatTimeHHmm;
-(NSDateComponents *)getTimeDifference:(NSDate *)start andSchedule:(NSDate *)end;


@end
