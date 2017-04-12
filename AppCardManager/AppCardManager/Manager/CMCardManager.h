//
//  CMCardManager.h
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 12/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

@import Foundation;
#import "CMCard.h"

typedef void (^CardBlockManager) (CMCard *);

@interface CMCardManager : NSObject

/**
 *  <#Description#>
 *
 *  @param completion <#completion description#>
 */
- (void)defineCardToShow:(CardBlockManager)completion;

@end
