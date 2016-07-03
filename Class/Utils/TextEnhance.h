//
//  TextEnhance.h
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/2.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UILabel;
@class UIButton;

@interface TextEnhance : NSObject

+ (void)resizeUILabelWidth:(UILabel *)label;

+ (void)resizeUIButtonWith:(UIButton *)label;

@end
