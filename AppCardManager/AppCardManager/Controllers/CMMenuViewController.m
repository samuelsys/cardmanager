//
//  CMMenuViewController.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 11/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "CMMenuViewController.h"
#import "CMSingletonUser.h"

@implementation CMMenuViewController{

    NSArray *menu;
}

- (void) viewDidLoad{
    [super viewDidLoad];
 
    //TODO
    //add constants to ITEMS
    
    menu = @[@"id_profile", @"id_cards", @"id_extract", @"id_schedule", @"id_about", @"id_logout"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return menu.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellIdentifier = menu[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //add constants to first
    if ([menu[indexPath.row] isEqualToString:@"id_profile"]){
        return 150;
    }
    
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if ([cell.reuseIdentifier isEqualToString:@"id_logout"]){
        [self dismissViewControllerAnimated:NO completion:^{
            [CMSingletonUser sharedInstance].loggedUser = nil;
        }];
    }
}







@end
