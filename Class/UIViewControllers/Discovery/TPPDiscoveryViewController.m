//
//  TPPDiscoveryViewController.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/6/30.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPDiscoveryViewController.h"
#import "TPPDiscoveryTableView.h"

@interface TPPDiscoveryViewController()

@property (nonatomic, strong) TPPDiscoveryTableView *tableView;

@end

@implementation TPPDiscoveryViewController

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

    }

    return self;
}

- (void)render {
    [self.view addSubview:self.tableView];
}

- (TPPDiscoveryTableView *)tableView {
    if (!_tableView) {
        _tableView = [[TPPDiscoveryTableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, (SCREEN_HEIGHT-64-44)) style:UITableViewStyleGrouped];
    }

    return _tableView;
}

@end
