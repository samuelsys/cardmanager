//
//  CMSingletonUser.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 07/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "CMSingletonUser.h"

@implementation CMSingletonUser

+(instancetype) sharedInstance{
    static CMSingletonUser *sharedInstance = nil;
    if (!sharedInstance){
        sharedInstance = [CMSingletonUser new];
    }
    return sharedInstance;
}
@end
