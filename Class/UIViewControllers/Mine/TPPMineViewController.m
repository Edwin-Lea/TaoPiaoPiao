//
//  TPPMineViewController.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/6/30.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPMineViewController.h"
#import "TPPMineWantsViewController.h"
#import "TPPMineSeenViewController.h"
#import "TPPMineHelpViewController.h"
#import "TPPMineSettingViewController.h"

@interface TPPMineViewController() <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIImageView *avatar;
@property (nonatomic, strong) UIImageView *remind;
@property (nonatomic, strong) UILabel *username;
@property (nonatomic, strong) UIImageView *level;
@property (nonatomic, strong) UIButton *message;
@property (nonatomic, strong) UIImageView *btns;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *array;

@property (nonatomic, weak) id<TPPMineViewDelegate> delegate;

@end

@implementation TPPMineViewController

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

        // 关闭导航栏
        [self.navigationController setNavigationBarHidden:YES animated:NO];

        [self render];
    }

    return self;
}

- (void)render {
    // TODO : 渲染
    [self.view addSubview:[self renderUserPart]];
    [self.view addSubview:self.btns];
    [self.view addSubview:self.tableView];
}

- (UIView *)renderUserPart {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 217)];
    view.backgroundColor = [UIColor whiteColor];

    [view addSubview:self.remind];
    [view addSubview:self.avatar];
    [view addSubview:self.username];
    [view addSubview:self.level];
    [view addSubview:self.message];

    return view;
}

- (NSArray *)array {
    if (!_array) {
        _array = @[@"想看的电影", @"看过的电影", @"帮组中心", @"设置"];
    }

    return _array;
}

- (UIImageView *)remind {
    if (!_remind) {
        _remind = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"remind.png"]];
        _remind.frame = CGRectMake((SCREEN_WIDTH-13-25), 10, 25, 25);
    }

    return _remind;
}

- (UIImageView *)avatar {
    if (!_avatar) {
        _avatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"avatar.png"]];
        _avatar.frame = CGRectMake((SCREEN_WIDTH-83)/2, 26, 83, 83);
        _avatar.layer.borderColor = COLOR_RGB(245, 245, 245).CGColor;
        _avatar.layer.borderWidth = 2;
        _avatar.layer.cornerRadius = 41.5;
        _avatar.clipsToBounds = YES;
    }

    return _avatar;
}

- (UILabel *)username {
    if (!_username) {
        CGRect rect = CGRectMake(0, (MaxY(self.avatar)+12), 200, 18);
        _username = [[UILabel alloc] initWithFrame:rect];
        _username.text = @"tyn164710166";
        _username.font = [UIFont systemFontOfSize:17];
        _username.textColor = COLOR_RGB(34, 34, 39);

        // 自适应宽度
        [TextEnhance resizeUILabelWidth:_username];
        rect.origin.x = (SCREEN_WIDTH-_username.frame.size.width)/2;
        _username.frame = rect;
    }

    return _username;
}

- (UIImageView *)level {
    if (!_level) {
        _level = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lavel.png"]];
        _level.frame = CGRectMake((SCREEN_WIDTH-75)/2, (MaxY(self.username)+8), 75, 20);
    }

    return _level;
}

- (UIButton *)message {
    if (!_message) {
        CGRect rect = CGRectMake(0, (MaxY(self.level)+12), SCREEN_WIDTH, 18);
        _message = [[UIButton alloc] initWithFrame:rect];
        [_message setTitle:@"有代金券可以领 >" forState:UIControlStateNormal];
        [_message setTitleColor:COLOR_RGB(138, 134, 158) forState:UIControlStateNormal];
        _message.titleLabel.font = [UIFont systemFontOfSize:14];
    }

    return _message;
}

- (UIImageView *)btns {
    if (!_btns) {
        _btns = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"4btn.png"]];
        _btns.frame = CGRectMake(0, 230, SCREEN_WIDTH, 76);
    }

    return _btns;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, (MaxY(self.btns)+10), SCREEN_WIDTH, 220) style:UITableViewStylePlain];

        _tableView.minimumZoomScale = 1.0;
        _tableView.maximumZoomScale = 1.0;

        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;

        _tableView.bounces = NO;
        _tableView.backgroundColor = [UIColor whiteColor];

        _tableView.delegate = self;
        _tableView.dataSource = self;
    }

    return _tableView;
}

#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"MineCell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = self.array[(NSUInteger)indexPath.row];

        // 添加手势
        UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cellClickHandler:)];
        gestureRecognizer.numberOfTapsRequired = 1;
        cell.tag = indexPath.row;
        [cell addGestureRecognizer:gestureRecognizer];
    }

    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark -
#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:!cell.selected];
}

#pragma mark -
#pragma mark owner delegate
- (void)cellClickHandler:(UITapGestureRecognizer *)recognizer {
    NSUInteger index = (NSUInteger)recognizer.view.tag;
    NSString *title = self.array[index];
    switch (index) {
        case 0:
        {
            // 想看的电影
            TPPMineWantsViewController *controller = [[TPPMineWantsViewController alloc] init];
            self.delegate = controller;
            [self.delegate tppMineViewCellClicked:title];

            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        case 1:
        {
            // 看过的电影
            TPPMineSeenViewController *controller = [[TPPMineSeenViewController alloc] init];
            self.delegate = controller;
            [self.delegate tppMineViewCellClicked:title];

            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        case 2:
        {
            // 帮助文档
            TPPMineHelpViewController *controller = [[TPPMineHelpViewController alloc] init];
            self.delegate = controller;
            [self.delegate tppMineViewCellClicked:title];

            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        case 3:
        {
            // 设置
            TPPMineSettingViewController *controller = [[TPPMineSettingViewController alloc] init];
            self.delegate = controller;
            [self.delegate tppMineViewCellClicked:title];

            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        default:
        {

        }
            break;
    }
}

@end
