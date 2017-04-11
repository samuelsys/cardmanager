//
//  CMMasks.h
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 10/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

@import Foundation;
@import UIKit;

@interface CMMasks : NSObject

/**
 *  Configure mask to Celphone String
 *
 *  @param text Celphone string
 *
 *  @return Valid Mask
 */
+ (NSString *)configurePhoneMask:(NSString *)text;

@end
