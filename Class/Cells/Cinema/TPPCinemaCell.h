//
//  TPPCinemaCell.h
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/3.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TPPCinemaModel;

@interface TPPCinemaCell : UITableViewCell

- (void)setData:(TPPCinemaModel *)data;

- (instancetype)render;

@end
