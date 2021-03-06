//
//  CMAlerts.h
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 04/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

@import Foundation;
#import <UIKit/UIKit.h>

@interface CMAlerts : NSObject

/**
 *  Pop up a simple alert on screen
 *
 *  @param message message to be showed
 *  @param title   title of the box
 *  @param vc      view controller
 */

+ (void)showMessage:(NSString*)message withTitle:(NSString *)title viewController:(UIViewController*) viewController;

@end
