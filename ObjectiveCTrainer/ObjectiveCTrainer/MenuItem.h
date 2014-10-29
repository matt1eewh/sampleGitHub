//
//  MenuItem.h
//  ObjectiveCTrainer
//
//  Created by XcodeDev on 28/10/14.
//  Copyright (c) 2014 XcodeDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuItem : NSObject

@property (nonatomic, strong) NSString *menuTitle;
@property (nonatomic, strong) NSString *menuIcon;

@property (nonatomic) int ScreenType;

@end
