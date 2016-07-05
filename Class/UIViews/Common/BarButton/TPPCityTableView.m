//
//  TPPCityTableView.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/5.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPCityTableView.h"
#import "TPPFileManager.h"

@interface TPPCityTableView() <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableDictionary *mutableDict;
@property (nonatomic, strong) NSMutableArray *keys;

@end

@implementation TPPCityTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];

    if (self) {
        self.minimumZoomScale = 1.0;
        self.maximumZoomScale = 1.0;

        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;

        self.bounces = NO;

        self.delegate = self;
        self.dataSource = self;

        self.separatorStyle = UITableViewCellSeparatorStyleNone;

        self.backgroundColor = COLOR_RGBA(255, 255, 255, 0.9);

        [self loadData];
    }

    return self;
}

- (void)loadData {
    self.mutableDict = [[[TPPFileManager getInstance] readDictionaryFromFile:@"city"] mutableCopy];
    self.keys = [@[@"热门", @"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"J", @"K", @"L", @"M", @"N", @"P", @"Q", @"R", @"S", @"T", @"W", @"X", @"Y", @"Z"] mutableCopy];
}

- (NSMutableDictionary *)mutableDict {
    if (!_mutableDict) {
        _mutableDict = [NSMutableDictionary dictionary];
    }

    return _mutableDict;
}

- (NSMutableArray *)keys {
    if (!_keys) {
        _keys = [NSMutableArray array];
    }

    return _keys;
}

#pragma mark -
#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // TODO : 点击cell动作
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 200, 30)];
    label.text = self.keys[(NSUInteger)section];
    label.textColor = COLOR_RGB(80, 80, 90);
    label.font = [UIFont systemFontOfSize:13];

    view.backgroundColor = COLOR_RGB(245, 245, 245);
    [view addSubview:label];

    return view;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableArray *mArray = [self.keys mutableCopy];
    mArray[0] = @"热";

    return mArray;
}




#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *key = self.keys[(NSUInteger)section];
    NSArray *array = self.mutableDict[key];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"TPPCityCell";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

    NSString *key = self.keys[(NSUInteger)indexPath.section];
    NSArray *array = self.mutableDict[key];
    NSString *cityName = array[(NSUInteger)indexPath.row];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        cell.textLabel.text = cityName;

        cell.backgroundColor = COLOR_RGBA(255, 255, 255, 0.9);

        UIView *underline = [[UIView alloc] initWithFrame:CGRectMake(0, 49.5, SCREEN_WIDTH, 0.5)];
        underline.backgroundColor = COLOR_RGB(80, 80, 90);
        [cell.contentView addSubview:underline];
        if ([cityName isEqualToString:@"大连"]) {
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"city_check.png"]];
            [cell.accessoryView addSubview:imageView];
            imageView.frame = CGRectMake(0, 0, 27, 21);
        }
    }

    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.keys.count;
}


@end
