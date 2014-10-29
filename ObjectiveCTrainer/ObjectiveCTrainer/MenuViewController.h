//
//  MenuViewController.h
//  ObjectiveCTrainer
//
//  Created by XcodeDev on 28/10/14.
//  Copyright (c) 2014 XcodeDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuModel.h"
#import "MenuItem.h"

@interface MenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) MenuModel *model;
@property (strong, nonatomic) NSArray *menuItems;


@property (strong, nonatomic) IBOutlet UITableView *tableList;

@end
