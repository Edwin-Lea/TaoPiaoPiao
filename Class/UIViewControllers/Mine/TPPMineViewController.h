//
//  TPPMineViewController.h
//  TaoPiaoPiao
//
//  Created by blackcater on 16/6/30.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TPPViewController.h"

@protocol TPPMineViewDelegate <NSObject>

@required
- (void)tppMineViewCellClicked:(NSString *)title;

@end

@interface TPPMineViewController : TPPViewController

@end
