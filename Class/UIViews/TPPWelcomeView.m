//
//  TPPWelcomeView.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/5.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPWelcomeView.h"

@interface TPPWelcomeView() <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation TPPWelcomeView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        [self render];
    }

    return self;
}

- (void)render {
    [self addImagesToScrollView];
    [self addSubview:self.scrollView];
    [self addSubview:self.pageControl];
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];

        _scrollView.minimumZoomScale = 1.0;
        _scrollView.maximumZoomScale = 1.0;

        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;

        _scrollView.bounces = NO;
        _scrollView.pagingEnabled = YES;

        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*WELCOME_PAHE_NUM, SCREEN_HEIGHT);
        _scrollView.contentOffset = CGPointZero;

        _scrollView.delegate = self;
    }

    return _scrollView;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-300)/2, (SCREEN_HEIGHT-14-6), 300, 14)];
        _pageControl.numberOfPages = WELCOME_PAHE_NUM;
        _pageControl.currentPage = 0;

        _pageControl.currentPageIndicatorTintColor = COLOR_RGB(239, 26, 40);
        _pageControl.pageIndicatorTintColor = COLOR_RGB(245, 245, 245);
    }

    return _pageControl;
}

- (void)addImagesToScrollView {
    int num = WELCOME_PAHE_NUM;
    for (int i=0; i<num; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@%d.jpg", WELCOME_FILE_NAME, (i+1)]]];
        imageView.frame = CGRectMake(SCREEN_WIDTH*i, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [self.scrollView addSubview:imageView];

        if ((i+1) == num) {
            // 添加button
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-200)/2, 460, 200, 44)];
            [button setTitle:@"立刻观影" forState:UIControlStateNormal];
            [button setTitleColor: COLOR_RGB(239, 26, 40) forState:UIControlStateNormal];
            button.layer.borderColor = COLOR_RGB(239, 26, 40).CGColor;
            button.layer.borderWidth = 2;
            button.layer.cornerRadius = 20;
            button.clipsToBounds = YES;
            button.backgroundColor = [UIColor clearColor];

            [button addTarget:self action:@selector(btnClickDownHandler:) forControlEvents:UIControlEventTouchDown];
            [button addTarget:self action:@selector(btnClickUpHandler:) forControlEvents:UIControlEventTouchUpInside];

            [imageView addSubview:button];
            imageView.userInteractionEnabled = YES;
        }
    }
}

- (void)btnClickDownHandler:(UIButton *)button {
    button.backgroundColor = COLOR_RGB(239, 26, 40);
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
}

- (void)btnClickUpHandler:(UIButton *)button {
    button.backgroundColor = [UIColor clearColor];

    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL flag) {
        // 清除视图
        [self removeFromSuperview];
    }];
}

#pragma mark -
#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int index = (int)floor(scrollView.contentOffset.x/SCREEN_WIDTH);
    self.pageControl.currentPage = index;
}


@end
