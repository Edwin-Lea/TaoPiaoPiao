//
//  TPPTabBarController.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/6/30.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPTabBarController.h"
#import "TPPCinemaViewController.h"
#import "TPPNavigationController.h"
#import "TPPFilmViewController.h"
#import "TPPDamaiViewController.h"
#import "TPPDiscoveryViewController.h"
#import "TPPMineViewController.h"

@interface TPPTabBarController()

@end

@implementation TPPTabBarController

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

- (instancetype)init {
    self = [super init];

    if (self) {
        // 设置背景颜色和大小
        self.view.backgroundColor = COLOR_RGB(245, 245, 245);
        self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);

        [self initControllers];
    }

    return self;
}


- (void)initControllers {
    // 电影tabbar
    TPPViewController *filmViewController = [self renderTabBarItem:[[TPPFilmViewController alloc] init] title:@"电影" imageNamed:@"film_normal.png" selectedImageNamed:@"film_selected.png"];
    TPPNavigationController *filmNavigationController = [[TPPNavigationController alloc] initWithRootViewController:filmViewController];

    // 影院tabbar
    TPPViewController *cinemaViewController = [self renderTabBarItem:[[TPPCinemaViewController alloc] init] title:@"影院" imageNamed:@"cinema_normal.png" selectedImageNamed:@"cinema_selected.png"];
    TPPNavigationController *cinemaNavigationController = [[TPPNavigationController alloc] initWithRootViewController:cinemaViewController];

    // 演出tabbar
    TPPViewController *damaiViewController = [self renderTabBarItem:[[TPPDamaiViewController alloc] init] title:@"演出" imageNamed:@"damai_normal.png" selectedImageNamed:@"damai_selected.png"];
    TPPNavigationController *damaiNavigationController = [[TPPNavigationController alloc] initWithRootViewController:damaiViewController];

    // 发现tabbar
    TPPViewController *discoveryViewController = [self renderTabBarItem:[[TPPDiscoveryViewController alloc] init] title:@"发现" imageNamed:@"discovery_normal.png" selectedImageNamed:@"discovery_selected.png"];
    TPPNavigationController *discoveryNavigationController = [[TPPNavigationController alloc] initWithRootViewController:discoveryViewController];

    // 我的tabbar
    TPPViewController *mineViewController = [self renderTabBarItem:[[TPPMineViewController alloc] init] title:@"我的" imageNamed:@"mine_normal.png" selectedImageNamed:@"mine_selected.png"];
    TPPNavigationController *mineNavigationController = [[TPPNavigationController alloc] initWithRootViewController:mineViewController];

    self.viewControllers = @[filmNavigationController, cinemaNavigationController, damaiNavigationController, discoveryNavigationController, mineNavigationController];
}

- (TPPViewController *)renderTabBarItem:(TPPViewController *)viewController
                               title:(NSString *)title
                          imageNamed:(NSString *)imageNamed
                  selectedImageNamed:(NSString *)selectedImageNamed {
    viewController.title = title;
    viewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[UIImage imageNamed:imageNamed] selectedImage:[[UIImage imageNamed:selectedImageNamed] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [viewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: COLOR_RGB(255, 81, 103)} forState:UIControlStateSelected];

    return viewController;
}

@end
