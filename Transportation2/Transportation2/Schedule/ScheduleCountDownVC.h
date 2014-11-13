//
//  ScheduleCountDownVC.h
//  Transportation2
//
//  Created by XcodeDev on 13/11/14.
//  Copyright (c) 2014 XcodeDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleCountDownVC : UIViewController

@property (weak, nonatomic) IBOutlet UIPickerView *routePicker;

@property (strong, nonatomic) IBOutlet UILabel *nowLabel;
@property (strong, nonatomic) IBOutlet UILabel *nextScheduleLabel;
@property (strong, nonatomic) IBOutlet UILabel *minLeftLabel;

@property (strong, nonatomic) IBOutlet UILabel *nextScheduleLabel2;

@property (strong, nonatomic) IBOutlet UILabel *minLeftLabel2;

@end
