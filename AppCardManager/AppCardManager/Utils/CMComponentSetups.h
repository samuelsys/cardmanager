//
//  CMComponentSetups.h
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 09/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

@import UIKit;

@interface CMComponentSetups : NSObject

/**
 *  Configure a textfield with color and placeholder
 *
 *  @param textField textfield
 *  @param color     color
 */
+ (void)setupTextField:(UITextField *)textField withColor:(UIColor *)color;

@end
