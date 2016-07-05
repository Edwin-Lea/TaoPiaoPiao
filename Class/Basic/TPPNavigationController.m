//
//  TPPNavigationController.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/6/30.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPNavigationController.h"

@implementation TPPNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)removeUnderline {
    [self.navigationBar setShadowImage:[UIImage new]];
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];

    if (self) {
        // 设置背景颜色和大小
//        self.view.backgroundColor = COLOR_RGB(245, 245, 245);
        self.view.backgroundColor = [UIColor yellowColor];
        self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"tabbar_bg.png"] forBarMetrics:UIBarMetricsDefault];
    }

    return self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

    // 第一个controller左button不确定, 其他controller左button为特定
    if (self.viewControllers.count > 0) {
        // 设置左button样式
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_button_normal.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backBtnClick:)];
    }

    [super pushViewController:viewController animated:animated];
}

- (void)backBtnClick:(id)sender {
    [self popViewControllerAnimated:YES];
}

@end
