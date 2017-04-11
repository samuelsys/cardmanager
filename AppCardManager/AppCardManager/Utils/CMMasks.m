//
//  CMMasks.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 10/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "CMMasks.h"

@implementation CMMasks

+ (NSString *)configurePhoneMask:(NSString *)text{
    if (text.length==2) {
        return [NSString stringWithFormat:@"(%@) ",text];
    } else if (text.length==10) {
        return [NSString stringWithFormat:@"%@-",text];
    }
    
    return text;
}

@end
