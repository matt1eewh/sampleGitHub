//
//  ScheduleCountDownVC.m
//  Transportation2
//
//  Created by XcodeDev on 13/11/14.
//  Copyright (c) 2014 XcodeDev. All rights reserved.
//

#import "ScheduleCountDownVC.h"
#import "SWRevealViewController.h"
#import "Schedule.h"
#import "ScheduleModel.h"
#import "TimeCalculator.h"
#import "ScheduleCalculator.h"


@interface ScheduleCountDownVC ()

@end

@implementation ScheduleCountDownVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    
    // create variable to store retrieved schedule
    ScheduleCalculator *model = [ ScheduleCalculator new];
    
    
    TimeCalculator *time = [TimeCalculator new];
    // format time in HHmm
    NSDateFormatter *timeFormatHHss = [time formatTimeHHmm];
    NSDate *currentTime = [TimeCalculator getCurrentTime];
    
    NSString *now = [timeFormatHHss stringFromDate:currentTime];
    NSLog(@"now:%@", now);
    
    // prepare route name
    NSString *routeNameT = @"NR332";
    NSString *routeName = [routeNameT stringByAppendingFormat:@"-KFtoMW-N"];
    NSLog(@"routeName: %@", routeName);
    
    // get next schedule from ScheduleCalculator class
    NSDate *nextScheduledTime = [model getNextSchedule:currentTime byRouteNumber:routeName];
    NSLog(@"%@- Next Schedule: %@", routeName,[timeFormatHHss stringFromDate:nextScheduledTime]);
    
    
    // calculate the difference between current time and next schedule time
    NSDateComponents *timeComponet = [time getTimeDifference:currentTime andSchedule:nextScheduledTime];
    NSLog(@"Minutes Left: %@", ([timeComponet minute] == 0) ? @"Due" : @([timeComponet minute]));
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
