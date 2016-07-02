//
//  TPPFilmCell.h
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/2.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TPPFilmModel;

@interface TPPFilmCell : UITableViewCell

- (instancetype)renderCurrentHotSell;

- (instancetype)renderComingSoonSell;

- (void)setData:(TPPFilmModel *)data;

@end
