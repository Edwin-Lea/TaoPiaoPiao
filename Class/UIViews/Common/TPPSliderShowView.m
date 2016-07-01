//
//  TPPSliderShowView.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/2.
//  Copyright © 2016年 blackcater. All rights reserved.
//

#import "TPPSliderShowView.h"

@interface TPPSliderShowView() <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
// config properties
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) NSUInteger num;
@property (nonatomic, strong) NSString *filename;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@end

@implementation TPPSliderShowView

- (instancetype)initWithFrame:(CGRect)frame
                          num:(NSUInteger)num
                     filename:(NSString *)filename
                        width:(CGFloat)width
                       height:(CGFloat)height {
    self = [super initWithFrame:frame];
    
    if (self) {
        _size = frame.size;
        _num = num;
        _filename = filename;
        _width = width;
        _height = height;
        
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
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.size.width, self.size.height)];
        
        _scrollView.minimumZoomScale = 1.0;
        _scrollView.maximumZoomScale = 1.0;
        
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        
        _scrollView.bounces = NO;
        _scrollView.pagingEnabled = YES;
        
        _scrollView.contentSize = CGSizeMake(self.size.width*self.num, self.size.height);
        _scrollView.contentOffset = CGPointZero;
        
        _scrollView.delegate = self;
    }
    
    return _scrollView;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((self.size.width-self.width)/2, (self.size.height-self.height-6), self.width, self.height)];
        _pageControl.numberOfPages = self.num;
        _pageControl.currentPage = 0;
    }
    
    return _pageControl;
}

- (void)addImagesToScrollView {
    int num = (int)self.num;
    for (int i=0; i<num; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@%d.jpg", self.filename, (i+1)]]];
        imageView.frame = CGRectMake(self.size.width*i, 0, self.size.width, self.size.height);
        [self.scrollView addSubview:imageView];
    }
}

#pragma mark -
#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int index = (int)floor(scrollView.contentOffset.x/self.size.width);
    self.pageControl.currentPage = index;
}

@end
