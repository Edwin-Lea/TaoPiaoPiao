//
//  TPPCurrentHotView.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/6/30.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPCurrentHotView.h"
#import "TPPSliderShowView.h"



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
    [self.data addObject:@"tom tang"];
    [self.data addObject:@"blackcater"];
    [self.data addObject:@"Tangyinong"];
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
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
            cell.textLabel.text = self.data[indexPath.row];
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
}

@end
