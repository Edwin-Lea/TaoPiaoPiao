//
//  TPPDamaiViewController.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/6/30.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPDamaiViewController.h"
#import "TPPDamaiTableView.h"
#import "TPPDamaiTopBarView.h"

@interface TPPDamaiViewController()

@property (nonatomic, strong) TPPDamaiTopBarView *topBarView;
@property (nonatomic, strong) TPPDamaiTableView *damaiTableView;

@end

@implementation TPPDamaiViewController

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
        [self render];
    }

    return self;
}

- (void)render {
    // TODO : 添加渲染规则
}

- (TPPDamaiTopBarView *)topBarView {
    if (!_topBarView) {
        _topBarView = [[TPPDamaiTopBarView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 42)];
    }

    return _topBarView;
}

@end
