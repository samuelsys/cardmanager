//
//  CMAdditions.h
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 05/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CMAdditions : NSObject

+ (UIColor *)cm_greyishBrownColor ;
+ (UIColor *)cm_whiteTwoColor;
+ (UIColor *)cm_orangishColor;
+ (UIColor *)cm_black54Color;
+ (UIColor *)cm_darkColor;

@end

@interface CMAdditions (CMAdditionsFonts)
+ (UIFont *)cm_headerFont ;
@end