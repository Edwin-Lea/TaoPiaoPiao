//
//  TPPCinemaTableView.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/3.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPCinemaTableView.h"
#import "TPPCinemaCell.h"
#import "TPPCinemaModel.h"

@interface TPPCinemaTableView() <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation TPPCinemaTableView

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
    TPPCinemaModel *cinema1 = [[TPPCinemaModel alloc] init];
    cinema1.title = @"大连万达影城高新店";
    cinema1.minPrice = 23.8;
    cinema1.address = @"大连市甘井子区黄浦路500号万达广场四楼";
    cinema1.distance = 7.50;
    cinema1.hallType = 2;
    cinema1.isOnSale = 1;

    TPPCinemaModel *cinema2 = [[TPPCinemaModel alloc] init];
    cinema2.title = @"大连米高梅国际影城(高新店)";
    cinema2.minPrice = 19.8;
    cinema2.address = @"大连市甘井子区黄浦路517号锦辉购物广场5层";
    cinema2.hallType = 1;
    cinema2.isOnSale = 1;
    cinema2.isSaved = 1;

    TPPCinemaModel *cinema3 = [[TPPCinemaModel alloc] init];
    cinema3.title = @"大连华臣影城软件园店";
    cinema3.minPrice = 20.8;
    cinema3.address = @"大连高新区数码路南段13-2号锦辉购物广场蜀山南路旁4楼";
    cinema3.isOnSale = 1;

    [self.datas addObjectsFromArray:@[cinema1, cinema2, cinema3]];
}

#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"TPPCinemaCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (!cell) {
        if (indexPath.row >= 0 && indexPath.row < self.datas.count) {
            NSObject *data = self.datas[(NSUInteger)indexPath.row];
            if (data && [data isKindOfClass:[TPPCinemaModel class]]) {
                TPPCinemaCell *cinemaCell = [[TPPCinemaCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
                [cinemaCell setData:(TPPCinemaModel *)data];
                cell = [cinemaCell render];
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
    // 当点击某个cell的时候, 做一些事情
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:!cell.selected];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 94;
}

@end
