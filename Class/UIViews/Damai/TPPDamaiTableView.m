//
//  TPPDamaiTableView.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/3.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPDamaiTableView.h"
#import "TPPDamaiCell.h"
#import "TPPDamaiModel.h"

@interface TPPDamaiTableView() <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *datas;

@end

@implementation TPPDamaiTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];

    if (self) {
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
    TPPDamaiModel *damaiModel1 = [[TPPDamaiModel alloc] init];
    damaiModel1.image = @"concert4.jpg";
    damaiModel1.title = @"[A CLASSIC TOUR 学友·经典]世界巡回演唱会 上海站";
    damaiModel1.minPrice = 680;
    damaiModel1.maxPrice = 2080;
    damaiModel1.categoryName = @"演唱会";
    damaiModel1.location = @"上海世博文化中心";
    damaiModel1.hasKeyWorkds = YES;
    damaiModel1.keyWords = @"张学友世界巡回演唱会";
    damaiModel1.time = 1467388800;

    TPPDamaiModel *damaiModel2 = [[TPPDamaiModel alloc] init];
    damaiModel2.image = @"concert1.jpg";
    damaiModel2.title = @"岳云鹏相声专场 上海站";
    damaiModel2.minPrice = 288;
    damaiModel2.maxPrice = 1288;
    damaiModel2.categoryName = @"曲苑杂坛";
    damaiModel2.location = @"卢湾体育馆";
    damaiModel2.hasKeyWorkds = NO;
    damaiModel2.time = 1467389900;

    TPPDamaiModel *damaiModel3 = [[TPPDamaiModel alloc] init];
    damaiModel3.image = @"concert2.jpg";
    damaiModel3.title = @"梁咏琪2016\"好时辰\"巡回演唱会";
    damaiModel3.minPrice = 280;
    damaiModel3.maxPrice = 1280;
    damaiModel3.categoryName = @"演唱会";
    damaiModel3.location = @"上海大舞台(上海体育馆)";
    damaiModel3.hasKeyWorkds = YES;
    damaiModel3.keyWords = @"梁咏琪";
    damaiModel3.time = 1468001000;

    TPPDamaiModel *damaiModel4 = [[TPPDamaiModel alloc] init];
    damaiModel4.image = @"concert3.jpg";
    damaiModel4.title = @"程慧娴Priscilla-ism演唱会 上海站";
    damaiModel4.minPrice = 280;
    damaiModel4.maxPrice = 880;
    damaiModel4.categoryName = @"演唱会";
    damaiModel4.location = @"上海梅赛德斯奔驰文化中心(上海世博文化中心)";
    damaiModel4.hasKeyWorkds = NO;
    damaiModel4.time = 1468011300;

    TPPDamaiModel *damaiModel5 = [[TPPDamaiModel alloc] init];
    damaiModel5.image = @"concert5.jpg";
    damaiModel5.title = @"刘落英上海演唱会";
    damaiModel5.minPrice = 380;
    damaiModel5.maxPrice = 1580;
    damaiModel5.categoryName = @"演唱会";
    damaiModel5.location = @"上海梅赛德斯奔驰文化中心(上海世博文化中心)";
    damaiModel5.hasKeyWorkds = NO;
    damaiModel5.time = 1469011300;

    [self.datas addObjectsFromArray:@[damaiModel1, damaiModel2, damaiModel3, damaiModel4, damaiModel5]];
}

- (NSMutableArray *)datas {
    if (!_datas) {
        _datas = [NSMutableArray array];
    }

    return _datas;
}



#pragma mark -
#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 当点击某个cell的时候, 做一些事情
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:!cell.selected];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    TPPDamaiModel *damaiModel = (TPPDamaiModel *)self.datas[(NSUInteger)indexPath.row];
    return damaiModel.hasKeyWorkds? (184) : (184-47);
}


#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"TPPDamaiCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (!cell) {
        if (indexPath.row >= 0 && indexPath.row < self.datas.count) {
            NSObject *data = self.datas[(NSUInteger)indexPath.row];
            if (data && [data isKindOfClass:[TPPDamaiModel class]]) {
                TPPDamaiCell *cinemaCell = [[TPPDamaiCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
                [cinemaCell setData:(TPPDamaiModel *)data];
                cell = [cinemaCell render];
                cell.selectedBackgroundView = [[UIView alloc] init];
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

@end
