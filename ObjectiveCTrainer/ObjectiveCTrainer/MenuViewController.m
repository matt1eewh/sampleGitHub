//
//  MenuViewController.m
//  ObjectiveCTrainer
//
//  Created by XcodeDev on 28/10/14.
//  Copyright (c) 2014 XcodeDev. All rights reserved.
//

#import "MenuViewController.h"
#import "SWRevealViewController.h"



@interface MenuViewController ()
{

}

@end

@implementation MenuViewController

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
    
    self.tableList.delegate = self;
    self.tableList.dataSource  = self;
    
    self.menuItems = [[[MenuModel alloc] init] getMenuItems];
   
    
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

#pragma mark Tableviw delegate methods

-(int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menuItems.count;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // retrieve cell
    NSString *cellIdentifier = @"MenuItemCell";
    UITableViewCell *menuCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // get menu item that it's asking for
    MenuItem *item = self.menuItems[indexPath.row];
    
    menuCell.textLabel.text = item.menuTitle;
    
    return menuCell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //check which item was tapped
    MenuItem *item = self.menuItems[indexPath.row];
    
    switch (item.ScreenType) {
        case ScreenTypeQuestion:
            [self performSegueWithIdentifier:@"GoToQuestionsSegue" sender:self];
            break;
            
        case ScreenTypeStats:
            [self performSegueWithIdentifier:@"GoToStatSegue" sender:self];
            break;
            
        case ScreenTypeAbout:
            [self performSegueWithIdentifier:@"GoToAboutSegue" sender:self];
            break;
            
        case ScreenTypeRemoveAds:
            [self performSegueWithIdentifier:@"GoToRemoveAdsSegue" sender:self];
            
        default:
            break;
    }
    
}

#pragma mark prepare for segue

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    // go to the VC according to the segue
    [self.revealViewController setFrontViewController:segue.destinationViewController];
    
    
    // return to menuVC
    [self.revealViewController revealToggleAnimated:YES];
    
    
    
}


@end
