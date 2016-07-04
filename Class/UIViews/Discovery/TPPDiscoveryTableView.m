//
//  TPPDiscoveryTableView.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/3.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPDiscoveryTableView.h"
#import "TPPDiscoveryHeaderView.h"
#import "TPPDiscoveryModel.h"
#import "TPPDiscoveryNewsCell.h"
#import "TPPDiscoveryLinesCell.h"
#import "TPPDiscoveryTalksCell.h"
#import "DateEnhance.h"

@interface TPPDiscoveryTableView() <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) TPPDiscoveryHeaderView *headerView;

@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation TPPDiscoveryTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];

    if (self) {
        self.backgroundColor = COLOR_RGB(245, 245, 245);

        self.minimumZoomScale = 1.0;
        self.maximumZoomScale = 1.0;

        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;

        // 不要cell间的分割线
        self.separatorStyle = UITableViewCellSeparatorStyleNone;

        self.tableHeaderView = self.headerView;

        self.delegate = self;
        self.dataSource = self;

        [self initData];
    }

    return self;
}

- (NSMutableArray *)datas {
    if (!_datas) {
        _datas = [NSMutableArray array];
    }

    return _datas;
}

- (TPPDiscoveryHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[TPPDiscoveryHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, (150+80+10))];
    }

    return _headerView;
}

- (void)initData {
    TPPDiscoveryModel *model1 = [[TPPDiscoveryModel alloc] init];
    model1.type = 1; // 新闻类
    model1.question = @"最懂舒淇的男人, 其实是他(才不是张震)";
    model1.desc = @"一个人, 没有同类";
    model1.category = @"毒蛇电影·戏里戏外";
    model1.imageNamed = @"news1.png";
    model1.supports = 301;
    model1.comments = 19;
    model1.time = 1467388800;

    TPPDiscoveryModel *model2 = [[TPPDiscoveryModel alloc] init];
    model2.type = 2;
    model2.question = @"要去采访大鱼海棠的导演了,你想问他们些什么?";
    model2.imageNamed = @"talks1.png";
    model2.supports = 196;
    model2.comments = 90;
    model2.time = 1467388800;
    model2.cellHeight = [self getHeight:model2];

    TPPDiscoveryModel *model3 = [[TPPDiscoveryModel alloc] init];
    model3.type = 3;
    model3.imageNamed = @"lines2.png";
    model3.supports = 869;
    model3.comments = 56;
    model3.time = 1467388800;
    model3.cellHeight = [self getHeight:model3];

    TPPDiscoveryModel *model4 = [[TPPDiscoveryModel alloc] init];
    model4.type = 2;
    model4.question = @"要去采访大鱼海棠的导演了,你想问他们些什么?";
    model4.imageNamed = @"talks1.png";
    model4.supports = 196;
    model4.comments = 90;
    model4.time = 1467388800;
    model4.cellHeight = [self getHeight:model4];

    TPPDiscoveryModel *model5 = [[TPPDiscoveryModel alloc] init];
    model5.type = 3;
    model5.imageNamed = @"lines2.png";
    model5.supports = 869;
    model5.comments = 56;
    model5.time = 1467388800;
    model5.cellHeight = [self getHeight:model5];

    TPPDiscoveryModel *model6 = [[TPPDiscoveryModel alloc] init];
    model6.type = 1; // 新闻类
    model6.question = @"最懂舒淇的男人, 其实是他(才不是张震)";
    model6.desc = @"一个人, 没有同类";
    model6.category = @"毒蛇电影·戏里戏外";
    model6.imageNamed = @"news1.png";
    model6.supports = 301;
    model6.comments = 19;
    model6.time = 1467388800;

    NSArray *array1 = @[model1, model2, model3];
    NSArray *array2 = @[model4, model5];
    NSArray *array3 = @[model6];
    [self.datas addObjectsFromArray:@[array1, array2, array3]];
}

#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [self.datas[(NSUInteger)section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"TPPDiscoveryCell";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

    NSInteger section = indexPath.section;
    NSInteger index = indexPath.row;

    if (!cell) {
        if (indexPath.section >=0 && indexPath.row >= 0 && section < self.datas.count && index < [self.datas[(NSUInteger)section] count]) {
            TPPDiscoveryModel *cdata = (TPPDiscoveryModel *)[self.datas[(NSUInteger)section] objectAtIndex:(NSUInteger)index];
            switch (cdata.type) {
                case 1:
                {
                    // 1 新闻类
                    TPPDiscoveryNewsCell *newsCell = [[TPPDiscoveryNewsCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
                    [newsCell setData:cdata];
                    cell = [newsCell render];
                }
                    break;
                case 2:
                {
                    // 2 话题讨论类
                    TPPDiscoveryTalksCell *newsCell = [[TPPDiscoveryTalksCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
                    [newsCell setData:cdata];
                    cell = [newsCell render];
                }
                    break;
                case 3:
                {
                    // 3 台词类
                    TPPDiscoveryLinesCell *newsCell = [[TPPDiscoveryLinesCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
                    [newsCell setData:cdata];
                    cell = [newsCell render];
                }
                    break;
                default:
                    break;
            }
        } else {
            cell = nil;
        }
    }

    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.datas.count;
}

#pragma mark -
#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView
        didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 当点击某个cell的时候, 做一些事情
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:!cell.selected];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    TPPDiscoveryModel *model = [self.datas[(NSUInteger) indexPath.section] objectAtIndex:(NSUInteger)indexPath.row];

    switch (model.type) {
        case 1:
            // 1 新闻类
            return 165;
        case 2:
            // 2 话题讨论类
        case 3:
            // 3 台词类
            return (CGFloat) model.cellHeight;
        default:
            return 0.5;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        UILabel *view = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];

        view.backgroundColor = COLOR_RGB(245, 245, 245);

        return view;
    } else {
        UILabel *view = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        TPPDiscoveryModel *model = [self.datas[(NSUInteger) section] objectAtIndex:0];
        view.backgroundColor = COLOR_RGB(245, 245, 245);

        view.text = [DateEnhance printDate:model.time];
        view.textColor = COLOR_RGB(138, 134, 158);
        view.textAlignment = NSTextAlignmentCenter;
        view.font = [UIFont systemFontOfSize:14];

        return view;
    };
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return (section == 0)? 10 : 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] initWithFrame:CGRectZero];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.5;
}

- (double)getHeight:(TPPDiscoveryModel *)model {
    UIImage *image = [UIImage imageNamed:model.imageNamed];
    return (image.size.height/2+65);
}

@end
