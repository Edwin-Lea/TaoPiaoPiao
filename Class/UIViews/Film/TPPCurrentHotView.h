//
//  TPPCurrentHotView.h
//  TaoPiaoPiao
//
//  Created by blackcater on 16/6/30.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TPPFilmModel;

@protocol TPPCurrentHotDelegate <NSObject>

- (void)hotCellClick:(TPPFilmModel *)model;

@end

@interface TPPCurrentHotView : UITableView

@property (nonatomic, weak) id<TPPCurrentHotDelegate> ownDelegate;

@end
