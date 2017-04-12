//
//  CMUserDefaultsProvider.h
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 12/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

@import Foundation;

@interface CMUserDefaultsProvider : NSObject

+ (instancetype)sharedInstance;

/**
 *  get a card saved in UserDefaults with the key stored in constant CMKeyForCardNumberUserDefaults
 *
 *  @return Card Number as NSInteger
 */

- (NSInteger)getCardNumberOnUserDefaults;

/**
 *  save a card in UserDefaults with the key stored in constant CMKeyForCardNumberUserDefaults
 *
 */
- (void)saveCardNumberOnUserDefaults:(id)cardNumber;

@end
