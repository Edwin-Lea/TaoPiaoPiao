//
//  TPPDiscoveryHeaderView.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/3.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPDiscoveryHeaderView.h"
#import "TPPSliderShowView.h"

@interface TPPDiscoveryHeaderView()

@property (nonatomic, strong) TPPSliderShowView *sliderShowView;
@property (nonatomic, strong) UIImageView *uiImageView;

@end

@implementation TPPDiscoveryHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self)  {
        [self render];
    }

    return self;
}

- (void)render {
    [self addSubview:self.sliderShowView];
    [self addSubview:self.uiImageView];
}

- (TPPSliderShowView *)sliderShowView {
    if (!_sliderShowView) {
        _sliderShowView = [[TPPSliderShowView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150) num:3 filename:@"discovery" width:300 height:8];
    }

    return _sliderShowView;
}

- (UIImageView *)uiImageView {
    if (!_uiImageView) {
        _uiImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"topBtn.png"]];
        _uiImageView.frame = CGRectMake(0, 150, SCREEN_WIDTH, 80);
    }

    return _uiImageView;
}

@end
