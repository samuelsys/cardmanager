//
//  CMMenuViewController.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 11/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "CMMenuViewController.h"
#import "CMSingletonUser.h"

static NSString *const CMMenuProfileIdentifier = @"id_profile";
static NSString *const CMMenuCardsIdentifier = @"id_cards";
static NSString *const CMMenuExtractIdentifier = @"id_extract";
static NSString *const CMMenuScheduleIdentifier = @"id_schedule";
static NSString *const CMMenuAboutIdentifier = @"id_about";
static NSString *const CMMenuLogoutIdentifier = @"id_logout";

typedef NS_ENUM (NSInteger, CMHeightForTableCellRow){
    CMHeightForTableCellRowProfile = 150,
    CMHeightForTableCellRowOtherMenus = 60
};

@implementation CMMenuViewController {
    NSArray *menu;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    
    menu = @[CMMenuProfileIdentifier, CMMenuCardsIdentifier, CMMenuExtractIdentifier, CMMenuScheduleIdentifier, CMMenuAboutIdentifier, CMMenuLogoutIdentifier];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return menu.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = menu[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([menu[indexPath.row] isEqualToString:CMMenuProfileIdentifier]){
        return CMHeightForTableCellRowProfile;
    }
    
    return CMHeightForTableCellRowOtherMenus;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if ([cell.reuseIdentifier isEqualToString:CMMenuLogoutIdentifier]){
        [self dismissViewControllerAnimated:NO completion:^{
            [CMSingletonUser sharedInstance].loggedUser = nil;
        }];
    }
}
@end
