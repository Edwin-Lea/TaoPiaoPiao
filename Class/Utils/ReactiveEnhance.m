//
//  ReactiveEnhance.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/4.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "ReactiveEnhance.h"
#import <UIKit/UIKit.h>

@implementation ReactiveEnhance

+(UIViewController*)getViewController:(UIView *)view
{
    for (UIView* next = [view superview]; next; next = next.superview)
    {
        UIResponder* nextResponder = [next nextResponder];

        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController*)nextResponder;
        }
    }

    return nil;
}

@end
