//
//  TPPComingSoonView.h
//  TaoPiaoPiao
//
//  Created by blackcater on 16/6/30.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TPPFilmModel;
@class TPPViewController;

@protocol TPPComingSoonViewDelegate <NSObject>

- (void)cellClick:(TPPFilmModel *)controller;

@end

@interface TPPComingSoonView : UITableView
@property (nonatomic, weak) id<TPPComingSoonViewDelegate> ownDelegate;

@end
