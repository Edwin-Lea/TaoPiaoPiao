//
//  TPPStarMarkView.h
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/2.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * 用于渲染星星评分
 */
@interface TPPStarMarkView : UIView

@property (nonatomic, assign) CGFloat mark;

- (instancetype)initWithPoint:(CGPoint)point mark:(CGFloat)mark;

- (instancetype)render;

@end
