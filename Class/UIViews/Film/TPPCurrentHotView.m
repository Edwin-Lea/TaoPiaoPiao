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


#pragma mark -
#pragma mark Protocal TPPFilmCurrentHotDelegate
@protocol TPPFilmCurrentHotDelegate

- (void)cellClickWithIndex:(NSUInteger)index;

@end



#pragma mark -
#pragma mark Extension
@interface TPPCurrentHotView() <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) id<TPPFilmCurrentHotDelegate> currentHotDelegate;
@property (nonatomic, strong) NSMutableArray *data;

@end



#pragma mark - 
#pragma marl Implementation
@implementation TPPCurrentHotView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];

    if (self) {
        self.tableHeaderView = [[TPPSliderShowView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150) num:FILM_PAGE_NUM filename:FILM_FILE_NAME width:300 height:8];

        self.minimumZoomScale = 1.0;
        self.maximumZoomScale = 1.0;

        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;

        self.separatorStyle = UITableViewCellSeparatorStyleNone;

        self.delegate = self;
        self.dataSource = self;
        
        [self initData];
    }

    return self;
}

- (NSMutableArray *)data {
    if (!_data) {
        _data = [NSMutableArray array];
    }
    
    return _data;
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

    TPPFilmModel *film2 = [[TPPFilmModel alloc] init];
    film2.title = @"忍者神龟2：破影而出";
    film2.subTitle = @"变种反派集合，梅根迷倒糖哥";
    film2.actors = @"梅根·福克斯,亚历桑德拉·安布罗休,斯蒂芬·阿梅尔,阿伦·瑞奇森";
    film2.mark = 8.4;
    film2.ribbonType = 4;
    film2.tagType = 1;
    film2.image = @"movie9.jpg";
    film2.time = 1467388800;


    [self.data addObjectsFromArray:@[film1, film2]];
}

#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // TODO : 返回自定义cell
    NSString *cellIdentifier = @"TPPCurrentHotCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        if (indexPath.row >= 0 && indexPath.row < self.data.count) {
            TPPFilmCell *filmCell = [[TPPFilmCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
            [filmCell setData:self.data[(NSUInteger)indexPath.row]];

            cell = [filmCell renderCurrentHotSell];
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
    return 113;
}

@end
