//
//  TPPWelcomeViewController.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/5.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPWelcomeViewController.h"

@interface TPPWelcomeViewController() <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation TPPWelcomeViewController

- (instancetype)init {
    self = [super init];

    if (self) {
        [self render];
    }

    return self;
}
- (void)render {
    [self addImagesToScrollView];
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.pageControl];
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
        }
    }
}

- (void)btnClickDownHandler:(UIButton *)button {
    button.backgroundColor = COLOR_RGB(239, 26, 40);
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
}

- (void)btnClickUpHandler:(UIButton *)button {
    button.backgroundColor = [UIColor clearColor];
}

#pragma mark -
#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int index = (int)floor(scrollView.contentOffset.x/SCREEN_WIDTH);
    self.pageControl.currentPage = index;
}


@end
