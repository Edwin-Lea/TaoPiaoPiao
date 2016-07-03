//
//  TPPFilmViewController.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/6/30.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPFilmViewController.h"
#import "TPPCurrentHotView.h"
#import "TPPComingSoonView.h"

@interface TPPFilmViewController() <UIScrollViewDelegate>

// 可能会用到代理
@property (nonatomic, strong) TPPCurrentHotView *currentHotView;
@property (nonatomic, strong) TPPComingSoonView *comingSoonView;
@property (nonatomic, strong) UIView *topBarView;
@property (nonatomic, strong) UIButton *currentHotBtn;
@property (nonatomic, strong) UIButton *comingSoonBtn;
@property (nonatomic, strong) UIView *underline;

@end

@implementation TPPFilmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (instancetype)init {
    self = [super init];

    if (self) {
        self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);

        [self render];
    }

    return self;
}

- (void)render {
    // 给ScrollView添加button
    [self.view addSubview:self.topBarView];
    [self.view addSubview:self.underline];
    [self.view addSubview:self.currentHotView];
    [self.view addSubview:self.comingSoonView];
}

- (TPPCurrentHotView *)currentHotView {
    if (!_currentHotView) {
        _currentHotView = [[TPPCurrentHotView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, (SCREEN_HEIGHT-64-44-44)) style:UITableViewStylePlain];
    }

    return _currentHotView;
}

- (TPPComingSoonView *)comingSoonView {
    if (!_comingSoonView) {
        _comingSoonView = [[TPPComingSoonView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, (SCREEN_HEIGHT-64-44-44)) style:UITableViewStyleGrouped];
    }

    return _comingSoonView;
}


/*- (UIScrollView *)currentHotScrollView {
    if (_currentHotScrollView == nil) {
        _currentHotScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, (SCREEN_HEIGHT-64-44))];

        _currentHotScrollView.showsVerticalScrollIndicator = NO;
        _currentHotScrollView.showsHorizontalScrollIndicator = NO;

        _currentHotScrollView.contentOffset = CGPointMake(0, 0);

        _currentHotScrollView.pagingEnabled = YES;

        _currentHotScrollView.bounces = NO;

        _currentHotScrollView.minimumZoomScale = 1.0;
        _currentHotScrollView.maximumZoomScale = 1.0;

        _currentHotScrollView.delegate = self;

        _currentHotScrollView.backgroundColor = [UIColor greenColor];
    }

    return _currentHotScrollView;
}

- (UIScrollView *)comingSoonScrollView {
    if (_comingSoonScrollView == nil) {
        _comingSoonScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, (SCREEN_HEIGHT-64-44))];

        _comingSoonScrollView.showsVerticalScrollIndicator = NO;
        _comingSoonScrollView.showsHorizontalScrollIndicator = NO;

        _comingSoonScrollView.contentOffset = CGPointMake(0, 0);

        _comingSoonScrollView.pagingEnabled = YES;

        _comingSoonScrollView.bounces = NO;

        _comingSoonScrollView.minimumZoomScale = 1.0;
        _comingSoonScrollView.maximumZoomScale = 1.0;

        _comingSoonScrollView.alpha = 0.0;

        _comingSoonScrollView.delegate = self;

        _comingSoonScrollView.backgroundColor = [UIColor blueColor];
    }

    return _comingSoonScrollView;
}*/

- (UIView *)topBarView {
    if (_topBarView == nil) {
        _topBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
        _topBarView.backgroundColor = COLOR_RGB(242, 242, 242);

        // 0.5下边界线
        UIView *underline = [[UIView alloc] initWithFrame:CGRectMake(0, 43, SCREEN_WIDTH, 0.5)];
        underline.backgroundColor = COLOR_RGB(215, 215, 215);

        [_topBarView addSubview:self.currentHotBtn];
        [_topBarView addSubview:self.comingSoonBtn];
        [_topBarView addSubview:underline];
    }

    return _topBarView;
}

- (UIButton *)currentHotBtn {
    if (_currentHotBtn == nil) {
        _currentHotBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/2, 44)];
        [_currentHotBtn setTitle:@"正在热映" forState:UIControlStateNormal];
        [_currentHotBtn setTitleColor:COLOR_RGB(115, 110, 135) forState:UIControlStateNormal];
        [_currentHotBtn setTitleColor:COLOR_RGB(239, 50, 80) forState:UIControlStateHighlighted];
        [_currentHotBtn setTitleColor:COLOR_RGB(239, 50, 80) forState:UIControlStateSelected];

        _currentHotBtn.titleLabel.font = [UIFont systemFontOfSize:14];

        _currentHotBtn.adjustsImageWhenHighlighted = NO;

        [_currentHotBtn setSelected:YES];

        [_currentHotBtn setTag:1];

        [_currentHotBtn addTarget:self action:@selector(btnClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    }

    return _currentHotBtn;
}

- (UIButton *)comingSoonBtn {
    if (_comingSoonBtn == nil) {
        _comingSoonBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2, 0, SCREEN_WIDTH/2, 44)];
        [_comingSoonBtn setTitle:@"即将上映" forState:UIControlStateNormal];
        [_comingSoonBtn setTitleColor:COLOR_RGB(115, 110, 135) forState:UIControlStateNormal];
        [_comingSoonBtn setTitleColor:COLOR_RGB(239, 50, 80) forState:UIControlStateSelected];

        _comingSoonBtn.titleLabel.font = [UIFont systemFontOfSize:14];

        _comingSoonBtn.adjustsImageWhenHighlighted = NO;

        [_comingSoonBtn setTag:2];

        [_comingSoonBtn addTarget:self action:@selector(btnClickHandler:) forControlEvents:UIControlEventTouchUpInside];
    }

    return _comingSoonBtn;
}

- (UIView *)underline {
    if (!_underline) {
        _underline = [[UIView alloc] initWithFrame:CGRectMake(15, 42, (SCREEN_WIDTH/2-30), 2)];
        _underline.backgroundColor = COLOR_RGB(237, 18, 39);
    }

    return _underline;
}

- (void)btnClickHandler:(id)sender {
    if (sender && [sender isKindOfClass:[UIButton class]]) {
        UIButton *button = (UIButton *)sender;
        switch (button.tag) {
            case 1:
            {
                [self.currentHotBtn setSelected:YES];
                [self.comingSoonBtn setSelected:NO];

                [UIView animateWithDuration:.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    self.currentHotView.alpha = 1.0;
                    self.comingSoonView.alpha = 0.0;
                    self.underline.frame = CGRectMake(15, 42, (SCREEN_WIDTH/2-30), 2);
                } completion:^(BOOL flag) {}];
            }
                break;
            case 2:
            {
                [self.currentHotBtn setSelected:NO];
                [self.comingSoonBtn setSelected:YES];

                [UIView animateWithDuration:.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    self.currentHotView.alpha = 0.0;
                    self.comingSoonView.alpha = 1.0;
                    self.underline.frame = CGRectMake((SCREEN_WIDTH/2+15), 42, (SCREEN_WIDTH/2-30), 2);
                } completion:^(BOOL flag) {}];
            }
                break;
            default:
                break;
        }
    }
}


#pragma mark -
#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

}

@end
