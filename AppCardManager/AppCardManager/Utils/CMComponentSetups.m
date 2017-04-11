//
//  CMComponentSetups.m
//  AppCardManager
//
//  Created by Samuel Furtado e Silva on 09/04/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "CMComponentSetups.h"
#import "CMAdditions.h"

@implementation CMComponentSetups

+ (void)setupTextField:(UITextField *)textField withColor:(UIColor *)color{
    
    [textField setValue:color forKeyPath:@"_placeholderLabel.textColor"];
    [textField setValue:[CMAdditions cm_headerFont] forKeyPath:@"_placeholderLabel.font"];
    
    CALayer *border = [CALayer layer];
    CGFloat borderWidth = 0.6;
    
    border.borderColor = color.CGColor;
    
    border.frame = CGRectMake(0, textField.frame.size.height - borderWidth, textField.frame.size.width, textField.frame.size.height);
    
    border.borderWidth = borderWidth;
    
    textField.font = [CMAdditions cm_headerFont];
    
    [textField.layer addSublayer:border];
    
    textField.layer.masksToBounds = YES;
}



@end
