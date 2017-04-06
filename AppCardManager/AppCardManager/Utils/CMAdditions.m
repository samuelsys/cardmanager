//
//  CMAdditions.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 05/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "CMAdditions.h"

@implementation CMAdditions

+ (UIColor *)cm_greyishBrownColor {
    return [UIColor colorWithWhite:74.0f / 255.0f alpha:1.0f];
}

+ (UIColor *)cm_whiteTwoColor {
    return [UIColor colorWithWhite:1.0f alpha:1.0f];
}

+ (UIColor *)cm_orangishColor {
    return [UIColor colorWithRed:1.0f green:120.0f / 255.0f blue:50.0f / 255.0f alpha:1.0f];
}

+ (UIColor *)cm_black54Color {
    return [UIColor colorWithWhite:0.0f alpha:0.54f];
}

+ (UIColor *)cm_darkColor {
    return [UIColor colorWithRed:58.0f / 255.0f green:37.0f / 255.0f blue:74.0f / 255.0f alpha:1.0f];
}

@end

// Sample text styles

@implementation CMAdditions (CMAdditionsFonts)

+ (UIFont *)cm_headerFont {
    return [UIFont fontWithName:@"SFUIDisplay-Regular" size:24.0f];
}


@end
