//
//  TPPCurrentHotView.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/6/30.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPCurrentHotView.h"
#import "TPPSliderShowView.h"
#import "TPPFilmCell.h"
#import "TPPFilmModel.h"
#import "TPPFilmActivityModel.h"
#import "TPPFilmActivityCell.h"


#pragma mark -
#pragma mark Protocal TPPFilmCurrentHotDelegate
@protocol TPPFilmCurrentHotDelegate

- (void)cellClickWithIndex:(NSUInteger)index;

@end



#pragma mark -
#pragma mark Extension
@interface TPPCurrentHotView() <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) id<TPPFilmCurrentHotDelegate> currentHotDelegate;
@property (nonatomic, strong) NSMutableArray *datas;

@end



#pragma mark - 
#pragma marl Implementation
@implementation TPPCurrentHotView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];

    if (self) {
        self.backgroundColor = COLOR_RGB(245, 245, 245);

        self.tableHeaderView = [[TPPSliderShowView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150) num:FILM_PAGE_NUM filename:FILM_FILE_NAME width:300 height:8];

        self.minimumZoomScale = 1.0;
        self.maximumZoomScale = 1.0;

        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;

        // 不要cell间的分割线
        self.separatorStyle = UITableViewCellSeparatorStyleNone;

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

- (void)initData {
    TPPFilmModel *film1 = [[TPPFilmModel alloc] init];
    film1.title = @"忍者神龟2：破影而出";
    film1.subTitle = @"变种反派集合，梅根迷倒糖哥";
    film1.actors = @"梅根·福克斯,亚历桑德拉·安布罗休,斯蒂芬·阿梅尔,阿伦·瑞奇森";
    film1.mark = 8.4;
    film1.ribbonType = 1;
    film1.tagType = 2;
    film1.image = @"movie9.jpg";
    film1.time = 1477388800;

    TPPFilmActivityModel *activity1 = [[TPPFilmActivityModel alloc] init];
    activity1.name = @"14.8元起抢票";
    activity1.intro = @"《忍者神龟2》特惠,名额有限,先到先得!";

    TPPFilmActivityModel *activity2 = [[TPPFilmActivityModel alloc] init];
    activity2.name = @"神龟正版周边";
    activity2.intro = @"超值抢购  全场包邮";

    TPPFilmModel *film2 = [[TPPFilmModel alloc] init];
    film2.title = @"忍者神龟2：破影而出";
    film2.subTitle = @"变种反派集合，梅根迷倒糖哥";
    film2.actors = @"梅根·福克斯,亚历桑德拉·安布罗休,斯蒂芬·阿梅尔,阿伦·瑞奇森";
    film2.mark = 8.4;
    film2.ribbonType = 4;
    film2.tagType = 1;
    film2.image = @"movie9.jpg";
    film2.time = 1467388800;

    TPPFilmModel *film3 = [[TPPFilmModel alloc] init];
    film3.title = @"忍者神龟2：破影而出";
    film3.subTitle = @"变种反派集合，梅根迷倒糖哥";
    film3.actors = @"梅根·福克斯,亚历桑德拉·安布罗休,斯蒂芬·阿梅尔,阿伦·瑞奇森";
    film3.mark = 8.4;
    film3.ribbonType = 8;
    film3.tagType = 2;
    film3.image = @"movie1.jpg";
    film3.time = 1467388800;


    [self.datas addObjectsFromArray:@[film1, activity1, activity2, film2, film3]];
}

#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // TODO : 返回自定义cell
    NSString *cellIdentifier = @"TPPCurrentHotCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        if (indexPath.row >= 0 && indexPath.row < self.datas.count) {
            NSObject *data = self.datas[(NSUInteger)indexPath.row];
            if (data && [data isKindOfClass:[TPPFilmModel class]]) {
                TPPFilmCell *filmCell = [[TPPFilmCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
                [filmCell setData:(TPPFilmModel *)data];
                cell = [filmCell renderCurrentHotSell];
            } else if (data && [data isKindOfClass:[TPPFilmActivityModel class]]) {
                TPPFilmActivityCell *activityCell = [[TPPFilmActivityCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
                [activityCell setData:(TPPFilmActivityModel *)data];
                cell = [activityCell render];
            } else {
                cell = nil;
            }
        }
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}



#pragma mark -
#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView
        didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // TODO : 当点击某个cell的时候, 做一些事情
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:!cell.selected];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger index = (NSUInteger) indexPath.row;
    NSObject *data = self.datas[index];
    if (data && [data isKindOfClass:[TPPFilmModel class]]) {
        return 113;
    } else if (data && [data isKindOfClass:[TPPFilmActivityModel class]]) {
        return 40;
    } else {
        return 0;
    }
}

@end
