//
//  TextEnhance.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/2.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TextEnhance.h"
#import <UIKit/UIKit.h>

@implementation TextEnhance

+ (void)resizeUILabelWidth:(UILabel *)label {
    label.lineBreakMode = NSLineBreakByTruncatingTail;

    CGRect rect = label.frame;
    NSString *str = label.text;
    UIFont *font = label.font;
    CGSize size = CGSizeMake(rect.size.width, rect.size.height);

    CGRect labelSize = [str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil];
    NSLog(@"文本调整结果 : %@", NSStringFromCGRect(labelSize));
    // 调整frame
    rect.size.width = labelSize.size.width;
    rect.size.height = labelSize.size.height;
    label.frame = rect;
}

@end
