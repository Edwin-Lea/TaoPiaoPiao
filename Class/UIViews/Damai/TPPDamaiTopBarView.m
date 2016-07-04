//
//  TPPDamaiTopBarView.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/3.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPDamaiTopBarView.h"

@interface TPPDamaiTopBarView() <UIScrollViewDelegate>

@property (nonatomic, strong) UIButton *locationView;
@property (nonatomic, strong) UIScrollView *categoryScrollView;
@property (nonatomic, strong) UIView *underline;
@property (nonatomic, strong) UIView *categoryLine;
@property (nonatomic, strong) NSArray *categories;
@property (nonatomic, strong) NSMutableArray *buttons;

@end

@implementation TPPDamaiTopBarView

- (instancetype)initWithFrame:(CGRect)frame categoreis:(NSArray *)categories {
    self = [super initWithFrame:frame];

    if (self) {
        _categories = categories;

        [self render];
    }

    return self;
}

- (void)render {
    [self addSubview:self.locationView];
    [self addSubview:self.underline];
    [self.categoryScrollView addSubview:self.categoryLine];
    [self addCategories];
    [self addSubview:self.categoryScrollView];
}

- (UIButton *)locationView {
    if (!_locationView) {
        _locationView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 78, (self.frame.size.height-1))];
        [_locationView setTitle:@"全国" forState:UIControlStateNormal];
        _locationView.titleLabel.font = [UIFont systemFontOfSize:13];
        [_locationView setTitleColor:COLOR_RGB(80, 80, 90) forState:UIControlStateNormal];
        [_locationView setImage:[UIImage imageNamed:@"tbbuy_location.png"] forState:UIControlStateNormal];

        [_locationView addTarget:self action:@selector(chooseLocation:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _locationView;
}

- (UIScrollView *)categoryScrollView {
    if (!_categoryScrollView) {
        _categoryScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(88, 0, (SCREEN_WIDTH-88), self.frame.size.height-1)];

        _categoryScrollView.showsHorizontalScrollIndicator = NO;
        _categoryScrollView.showsVerticalScrollIndicator = NO;

        _categoryScrollView.bounces = NO;

        _categoryScrollView.minimumZoomScale = 1.0;
        _categoryScrollView.maximumZoomScale = 1.0;

        _categoryScrollView.contentOffset = CGPointZero;

        _categoryScrollView.delegate = self;
    }

    return _categoryScrollView;
}

- (UIView *)underline {
    if (!_underline) {
        _underline = [[UIView alloc] initWithFrame:CGRectMake(0, (self.frame.size.height-1), SCREEN_WIDTH, 1)];
        _underline.backgroundColor = COLOR_RGB(243, 243, 243);
    }

    return _underline;
}

- (UIView *)categoryLine {
    if (!_categoryLine) {
        _categoryLine = [[UIView alloc] initWithFrame:CGRectMake(10, (self.frame.size.height-2), 200, 1)];
        _categoryLine.backgroundColor = COLOR_RGB(255, 77, 100);
    }

    return _categoryLine;
}

- (NSMutableArray *)buttons {
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }

    return _buttons;
}

- (void)addCategories {
    CGFloat left = 0;

    UIButton *firstBtn = nil;
    for (int i = 0; i < self.categories.count; ++i) {
        NSString *title = self.categories[(NSUInteger)i];
        CGRect rect = CGRectMake(left, 0, 100, (self.frame.size.height-1));
        UIButton *button = [[UIButton alloc] initWithFrame:rect];

        button.titleLabel.font = [UIFont systemFontOfSize:13];

        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:COLOR_RGB(80, 80, 90) forState:UIControlStateNormal];
        [button setTitleColor:COLOR_RGB(255, 77, 100) forState:UIControlStateSelected];

        button.tag = i;
        [button addTarget:self action:@selector(categoryBtnClickHandler:) forControlEvents:UIControlEventTouchUpInside];

        [TextEnhance resizeUIButtonWith:button];

        left = button.frame.origin.x + button.frame.size.width;

        [self.categoryScrollView addSubview:button];

        if (i == 0) {
            firstBtn = button;
        }

        [self.buttons addObject:button];
    }

    self.categoryScrollView.contentSize = CGSizeMake(left, (self.frame.size.height-1));

    [firstBtn setSelected:YES];
    [self performSelector:@selector(categoryBtnClickHandler:) withObject:firstBtn];
}

-(void)chooseLocation:(id)sender {
    // TODO : 选择位置
}

- (void)categoryBtnClickHandler:(id)sender {
    if (sender && [sender isKindOfClass:[UIButton class]]) {
        UIButton *button = (UIButton *)sender; // +20
        CGRect rect = button.frame;
        // 重置激活状态
        for (int i = 0; i < self.buttons.count; ++i) {
            [self.buttons[(NSUInteger) i] setSelected:NO];
        }
        // 动画
        [button setSelected:YES];
        [UIView animateWithDuration:.2 delay:.0 options:UIViewAnimationOptionCurveEaseInOut animations:^ {
            CGRect lineFrame = self.categoryLine.frame;
            lineFrame.size.width = (rect.size.width-20);
            lineFrame.origin.x = (rect.origin.x+10);
            self.categoryLine.frame = lineFrame;

            // 修改图标位置 最小距离和最大距离指 categoryScrollView可见中心点距最左面距离
            CGSize size = self.categoryScrollView.contentSize;
            double maxX = (size.width-(SCREEN_WIDTH-88)/2);
            double minX = (SCREEN_WIDTH-88)/2;
            // btn中心距最左面距离
            double btnCenter = (button.frame.origin.x + button.frame.size.width/2);
            if (btnCenter >= minX && btnCenter <= maxX) {
                CGPoint point = self.categoryScrollView.frame.origin;
                point.x = (CGFloat)(btnCenter-(SCREEN_WIDTH-88)/2);
                self.categoryScrollView.contentOffset= point;
            } else if (btnCenter > maxX) {
                CGPoint point = self.categoryScrollView.frame.origin;
                point.x = (size.width-(SCREEN_WIDTH-88));
                self.categoryScrollView.contentOffset= point;
            } else {
                CGPoint point = self.categoryScrollView.frame.origin;
                point.x = 0;
                self.categoryScrollView.contentOffset= point;
            }

        } completion:^(BOOL flag) {
            // TODO : 点击完毕加载数据
        }];
    }
}



#pragma mark -
#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

}

@end
