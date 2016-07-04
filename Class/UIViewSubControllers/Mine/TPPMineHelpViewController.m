//
//  TPPMineHelpViewController.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/5.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPMineHelpViewController.h"

@interface TPPMineHelpViewController()
@end

@implementation TPPMineHelpViewController

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
        self.view.backgroundColor = COLOR_RGB(245, 245, 245);
    }

    return self;
}

#pragma mark -
#pragma mark TPPMineViewDelegate
- (void)tppMineViewCellClicked:(NSString *)title {
    self.title = title;
}

@end
