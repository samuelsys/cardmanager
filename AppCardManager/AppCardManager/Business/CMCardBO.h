//
//  CMCardBO.h
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 12/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

@import Foundation;
#import "CMCard.h"

typedef void (^CardBlock) (CMCard *);

@interface CMCardBO : NSObject

/**
 *
 *
 *  @param completion 
 */
+ (void)defineCardToShow:(CardBlock)completion;

@end
