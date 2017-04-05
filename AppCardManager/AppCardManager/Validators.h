//
//  Validators.h
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 04/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validators : NSObject

+ (instancetype) sharedInstance;
- (BOOL) isEmailValid:(NSString*) email;

@end
