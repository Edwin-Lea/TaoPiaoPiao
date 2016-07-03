//
//  TPPDamaiCell.h
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/3.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TPPDamaiModel;

@interface TPPDamaiCell : UITableViewCell

- (void)setData:(TPPDamaiModel *)data;

- (instancetype)render;

@end
