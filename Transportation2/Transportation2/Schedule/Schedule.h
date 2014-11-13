//
//  Schedule.h
//  Transportation2
//
//  Created by XcodeDev on 7/11/14.
//  Copyright (c) 2014 XcodeDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Schedule : NSObject

@property (strong, nonatomic) NSString *routeNumber;
@property (strong, nonatomic) NSString *routeDescriptions;
@property (strong, nonatomic) NSMutableArray *departureTimeAt;
@property (strong, nonatomic) NSString *terminalFrom;
@property (strong, nonatomic) NSString *terminalTo;
@property (strong, nonatomic) NSString *operationDay;
@property (nonatomic) float feeResidents;
@property (nonatomic) float feeVisitors;



@end
