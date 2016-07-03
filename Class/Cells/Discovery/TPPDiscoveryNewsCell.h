//
//  TPPDiscoveryNewsCell.h
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/3.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TPPDiscoveryModel;

@interface TPPDiscoveryNewsCell : UITableViewCell

- (void)setData:(TPPDiscoveryModel *)data ;

- (instancetype)render;

@end
