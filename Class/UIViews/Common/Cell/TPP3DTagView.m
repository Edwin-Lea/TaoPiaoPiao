//
//  TPP3DTagView.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/2.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPP3DTagView.h"

@implementation TPP3DTagView

- (instancetype)init {
    self = [super init];

    if (self) {

    }

    return self;
}

+ (instancetype)render {
    TPP3DTagView *view = [[TPP3DTagView alloc] init];

    [view addTag];

    return view;
}

- (void)addTag{
    // TODO : 设置Tag样式
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
