//
//  CMUserDefaultsProvider.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 12/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "CMUserDefaultsProvider.h"
#import "CMGenericConstants.h"

@implementation CMUserDefaultsProvider

+ (instancetype)sharedInstance {
    static CMUserDefaultsProvider *sharedInstance = nil;
    if (!sharedInstance){
        sharedInstance = [[CMUserDefaultsProvider alloc] init];
    }
    return sharedInstance;
}

- (NSInteger)getCardNumberOnUserDefaults {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [[defaults valueForKey:CMKeyForCardNumberUserDefaults] integerValue];
}

- (void)saveCardNumberOnUserDefaults:(id)cardNumber {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:cardNumber forKey:CMKeyForCardNumberUserDefaults];
}

@end
