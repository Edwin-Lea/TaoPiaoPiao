//
//  TPPFilmActivityCell.h
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/2.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TPPFilmActivityModel;

@interface TPPFilmActivityCell : UITableViewCell

@property (nonatomic, strong) TPPFilmActivityModel *data;

- (void)setData:(TPPFilmActivityModel *)data;

- (instancetype)render;

@end
