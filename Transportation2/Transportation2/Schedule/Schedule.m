//
//  Schedule.m
//  Transportation2
//
//  Created by XcodeDev on 7/11/14.
//  Copyright (c) 2014 XcodeDev. All rights reserved.
//

#import "Schedule.h"

@implementation Schedule


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.departureTimeAt = [NSMutableArray new];
    }
    return self;
}

@end
