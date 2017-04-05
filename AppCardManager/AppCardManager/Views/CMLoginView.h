//
//  CMLoginView.h
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 05/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMLoginView : UIView

typedef NS_ENUM(NSInteger, TextFieldConst){
    ACMloginPasswordTextLimit = 6,
    ACMloginEmailTextLimit = 100
};

- (void) setup;
- (void) tryPerformLogin;

@end
