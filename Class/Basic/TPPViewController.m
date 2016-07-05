//
//  TPPViewController.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/6/30.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPViewController.h"
#import "TPPCityChooseView.h"

@interface TPPViewController ()

@end

@implementation TPPViewController

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

// 初始化时做一些公共操作
- (instancetype)init {
    self = [super init];

    if (self) {
        // 设置背景颜色和大小
        self.view.backgroundColor = COLOR_RGB(245, 245, 245);
        self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    }

    return self;
}

/**
 * 用于选择当前位置
 */
- (void) addCityBarButton {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"大连" style:UIBarButtonItemStylePlain target:self action:@selector(cityBarButtonClick:)];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName: COLOR_RGB(80, 80, 90)} forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)cityBarButtonClick:(id)sender {
    TPPCityChooseView *cityChooseView = [[TPPCityChooseView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [[UIApplication sharedApplication].keyWindow addSubview:cityChooseView];

    [UIView animateWithDuration:.6 delay:0.0 options: UIViewAnimationOptionCurveEaseInOut animations:^{
        CGRect rect = cityChooseView.frame;
        rect.origin.y = 0;
        cityChooseView.frame = rect;
    } completion:^(BOOL flag) {}];
}

/**
 * 用于搜索
 */
- (void) addSearchBarButton {

}

/**
 * 用于扫描二维码
 */
- (void) addScanBarButton {

}

/**
 * 用于选择赛选影院
 */
- (void) addCinemaBarButton {

}

@end
