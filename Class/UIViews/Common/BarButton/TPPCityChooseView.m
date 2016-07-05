//
//  TPPCityChooseView.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/5.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPCityChooseView.h"
#import "TPPFileManager.h"
#import "TPPCityTableView.h"

@interface TPPCityChooseView() <UISearchBarDelegate, UISearchDisplayDelegate, UISearchControllerDelegate>

@property (nonatomic, strong) NSDictionary *dict;
@property (nonatomic, strong) NSMutableDictionary *mutableDict;
@property (nonatomic, strong) UIView *topBar;
@property (nonatomic, strong) UILabel *topBarLabel;
@property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, strong) UIView *underline;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) TPPCityTableView *cityTableView;
@property (nonatomic, strong) UITableView *resultTableView;

@end

@implementation TPPCityChooseView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        [self loadData];
        [self render];
    }

    return self;
}

- (void)loadData {
    self.dict = [[TPPFileManager getInstance] readDictionaryFromFile:@"city"];
    self.mutableDict = [self.dict mutableCopy];
}

- (void)render {
    [self addSubview:self.topBar];
    [self.topBar addSubview:self.topBarLabel];
    [self.topBar addSubview:self.closeBtn];
    [self.topBar addSubview:self.underline];
    [self addSubview:self.searchBar];
    [self addSubview:self.cityTableView];
    [self addSubview:self.resultTableView];
}

- (UIView *)topBar {
    if (!_topBar) {
        _topBar = [[UIView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 44)];
        _topBar.backgroundColor = COLOR_RGB(240, 240, 240);
    }

    return _topBar;
}

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 35)];
        _searchBar.placeholder = @"请输入城市名或拼音";

        _searchBar.delegate = self;

        _searchBar.backgroundImage = [UIImage imageNamed:@"searchbar_bg.png"];
    }
    return _searchBar;
}

- (UILabel *)topBarLabel {
    if (!_topBarLabel) {
        _topBarLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
        _topBarLabel.text = @"选择城市";
        _topBarLabel.textAlignment = NSTextAlignmentCenter;
        _topBarLabel.textColor = COLOR_RGB(34, 34, 39);
        _topBarLabel.font = [UIFont systemFontOfSize:18];
    }

    return _topBarLabel;
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
        [_closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
        [_closeBtn setTitleColor:COLOR_RGB(80, 80, 90) forState:UIControlStateNormal];
        _closeBtn.titleLabel.font = [UIFont systemFontOfSize:16];

        [_closeBtn addTarget:self action:@selector(closeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }

    return _closeBtn;
}

- (UIView *)underline {
    if (!_underline) {
        _underline = [[UIView alloc] initWithFrame:CGRectMake(0, 43.5, SCREEN_WIDTH, 0.5)];
        _underline.backgroundColor = COLOR_RGB(226, 226, 226);
    }

    return _underline;
}

- (TPPCityTableView *)cityTableView {
    if (!_cityTableView) {
        _cityTableView = [[TPPCityTableView alloc] initWithFrame:CGRectMake(0, (64+35), SCREEN_WIDTH, (SCREEN_HEIGHT-(64+35+44))) style:UITableViewStyleGrouped];
    }

    return _cityTableView;
}



#pragma mark -
#pragma mark UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"%@", searchText);
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:YES animated:YES];

    for (UIView *view in [[searchBar.subviews lastObject] subviews]) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *cancelBtn = (UIButton *)view;
            [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
            [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }

    return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"取消!");
}


- (void)closeBtnClick:(UIButton *)button {
    [UIView animateWithDuration:0.6 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        CGRect rect = self.frame;
        rect.origin.y = SCREEN_HEIGHT;
        self.frame = rect;
    } completion:^(BOOL flag) {
        // 移除视图
        [self removeFromSuperview];
    }];
}

- (NSDictionary *)dict {
    if (!_dict) {
        _dict = [NSDictionary dictionary];
    }

    return _dict;
}

- (NSMutableDictionary *)mutableDict {
    if (!_mutableDict) {
        _mutableDict = [NSMutableDictionary dictionary];
    }

    return _mutableDict;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end