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
@property (nonatomic, strong) NSArray *categories;

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
        self.view.backgroundColor = [UIColor whiteColor];

        [self render];
    }

    return self;
}

- (void)render {
    [self.view addSubview:self.topBarView];
    [self.view addSubview:self.damaiTableView];
}

- (NSArray *)categories {
    if (!_categories) {
        _categories = @[@"全部演出", @"演唱会", @"音乐会", @"话剧歌剧", @"舞蹈芭蕾", @"曲苑杂坛"];
    }

    return _categories;
}

- (TPPDamaiTopBarView *)topBarView {
    if (!_topBarView) {
        _topBarView = [[TPPDamaiTopBarView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 42) categoreis:self.categories];
    }

    return _topBarView;
}

- (TPPDamaiTableView *)damaiTableView {
    if (!_damaiTableView) {
        _damaiTableView = [[TPPDamaiTableView alloc] initWithFrame:CGRectMake(0, 42, SCREEN_WIDTH, (SCREEN_HEIGHT-64-44-42)) style:UITableViewStylePlain];
    }

    return _damaiTableView;
}

@end
