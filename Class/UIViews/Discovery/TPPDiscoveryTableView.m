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
#import "TPPDiscoveryTalkCell.h"
#import "TPPDiscoveryLinesCell.h"
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
        _headerView = [[TPPDiscoveryHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, (150+80))];
    }

    return _headerView;
}

- (void)initData {
    // TODO : 初始化数据
}

#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [self.datas[(NSUInteger)section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"TPPCinemaCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (!cell) {
        if (indexPath.row >= 0 && indexPath.row < self.datas.count) {
            NSObject *data = self.datas[(NSUInteger)indexPath.row];
            if (data && [data isKindOfClass:[TPPDiscoveryModel class]]) {
                TPPDiscoveryModel *cdata = (TPPDiscoveryModel *)data;
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
                        TPPDiscoveryTalkCell *newsCell = [[TPPDiscoveryTalkCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
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
    TPPDiscoveryModel *model = self.datas[(NSUInteger)indexPath.row];
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
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];

        view.backgroundColor = COLOR_RGB(245, 245, 245);

        return view;
    } else {
        UILabel *view = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        TPPDiscoveryModel *model = self.datas[(NSUInteger)section];
        view.backgroundColor = COLOR_RGB(245, 245, 245);

        view.text = [DateEnhance printDate:model.time];
        view.textColor = COLOR_RGB(138, 134, 158);
        view.font = [UIFont systemFontOfSize:13];

        return view;
    };
}

@end
