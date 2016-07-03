//
//  TPPCinemaViewController.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/6/30.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPCinemaViewController.h"
#import "TPPCinemaTableView.h"

@interface TPPCinemaViewController()

@property (nonatomic, strong) TPPCinemaTableView *cinemaTableView;
@property (nonatomic, strong) UIView *underline;

@end

@implementation TPPCinemaViewController

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
    [self.view addSubview:self.cinemaTableView];
}

- (TPPCinemaTableView *)cinemaTableView {
    if (!_cinemaTableView) {
        _cinemaTableView = [[TPPCinemaTableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, (SCREEN_HEIGHT-64-44)) style:UITableViewStylePlain];
    }

    return _cinemaTableView;
}

- (UIView *)underline {
    if (!_underline) {
        _underline = [[UIView alloc] initWithFrame:CGRectMake(0, -1, SCREEN_WIDTH, 0.5)];
        _underline.backgroundColor = COLOR_RGB(226, 226, 226);
    }

    return _underline;
}

@end
