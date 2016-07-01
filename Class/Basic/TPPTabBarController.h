//
//  TPPTabBarController.h
//  TaoPiaoPiao
//
//  Created by blackcater on 16/6/30.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TPPViewController;

@interface TPPTabBarController : UITabBarController

- (TPPViewController *)renderTabBarItem:(TPPViewController *)viewController
                                title:(NSString *)title
                           imageNamed:(NSString *)imageNamed
                   selectedImageNamed:(NSString *)selectedImageNamed;
@end
