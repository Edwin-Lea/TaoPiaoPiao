//
//  TPPComingSoonView.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/6/30.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPComingSoonView.h"
#import "TPPFilmCell.h"
#import "TPPFilmModel.h"
#import "DateEnhance.h"

@interface TPPComingSoonView() <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation TPPComingSoonView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];

    if (self) {
        self.backgroundColor = COLOR_RGB(245, 245, 245);
        self.alpha = 0.0;

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

- (void)initData {
    TPPFilmModel *film1 = [[TPPFilmModel alloc] init];
    film1.title = @"大鱼海棠";
    film1.wants = 168065;
    film1.tagType = 2;
    film1.director = @"梁璇 张春";
    film1.actors = @"季冠霖 苏尚钦 许魏洲";
    film1.image = @"movie3.jpg";
    film1.time = 1467561600;

    TPPFilmModel *film2 = [[TPPFilmModel alloc] init];
    film2.title = @"大鱼海棠";
    film2.wants = 93761;
    film2.tagType = 1;
    film2.director = @"梁璇 张春";
    film2.actors = @"季冠霖 苏尚钦 许魏洲";
    film2.image = @"movie5.jpg";
    film2.time = 1467734400;

    TPPFilmModel *film3 = [[TPPFilmModel alloc] init];
    film3.title = @"大鱼海棠";
    film3.wants = 229114;
    film3.tagType = 0;
    film3.director = @"梁璇 张春";
    film3.actors = @"季冠霖 苏尚钦 许魏洲";
    film3.image = @"movie4.jpg";
    film3.time = 1467734400;

    TPPFilmModel *film4 = [[TPPFilmModel alloc] init];
    film4.title = @"大鱼海棠";
    film4.wants = 229114;
    film4.tagType = 2;
    film4.director = @"梁璇 张春";
    film4.actors = @"季冠霖 苏尚钦 许魏洲";
    film4.image = @"movie1.jpg";
    film4.time = 1468080000;

    [self.datas addObjectsFromArray:@[@[film1], @[film2, film3], @[film4]]];
}

-(NSMutableArray *)datas {
    if (!_datas) {
        _datas = [NSMutableArray array];
    }

    return _datas;
}

#pragma mark -
#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 点击的时候, 做一些事情
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:!cell.selected];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 36;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 113;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 36)];
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 13, SCREEN_WIDTH, 10)];

    TPPFilmModel *filmModel = [self.datas[(NSUInteger)section] objectAtIndex:0];
    if (filmModel && filmModel.time) {
        textLabel.text = [DateEnhance getWeakDay:filmModel.time];
        textLabel.font = [UIFont systemFontOfSize:13];
        [textLabel setTextColor:COLOR_RGB(80, 80, 90)];
    }

    [TextEnhance resizeUILabelWidth:textLabel];

    [headerView addSubview:textLabel];

    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.datas[(NSUInteger)section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"ComingSoonCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (!cell) {
        NSInteger section = indexPath.section;
        NSInteger index = indexPath.row;
        if (indexPath.section >=0 && indexPath.row >= 0 && section < self.datas.count && index < [self.datas[(NSUInteger)section] count]) {
            TPPFilmCell *filmCell = [[TPPFilmCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
            [filmCell setData:(TPPFilmModel *) [self.datas[(NSUInteger) section] objectAtIndex:(NSUInteger)index]];
            cell = [filmCell renderComingSoonSell];
        }
    }

    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.datas count];
}

/*//去掉UItableview headerview黏性(sticky)

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    if (scrollView == self)

    {
        CGFloat sectionHeaderHeight = 36; //sectionHeaderHeight

        if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y >= sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }

    }

}*/

@end
