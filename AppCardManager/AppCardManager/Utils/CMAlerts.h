//
//  CMAlerts.h
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 04/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CMAlerts : NSObject

+ (instancetype) sharedInstance;
-(void)showMessage:(NSString*)message withTitle:(NSString *)title viewController:(UIViewController*) vc;

@end
