//
//  ScheduleModel.h
//  Transportation2
//
//  Created by XcodeDev on 7/11/14.
//  Copyright (c) 2014 XcodeDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScheduleModel : NSObject

@property NSArray *routeSchedule;

@property (strong, nonatomic) NSMutableDictionary *routeDetailsDict;

//-(void)getTheRouteSchedule:(NSDate*)currentTime andRouteNumber:(NSString*)routeNumber;

-(NSMutableDictionary*)getRoutesDetails;




@end
