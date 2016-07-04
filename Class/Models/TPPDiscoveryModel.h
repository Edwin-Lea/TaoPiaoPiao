//
//  TPPDiscoveryModel.h
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/3.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TPPDiscoveryModel : NSObject

@property (nonatomic, copy) NSString *imageNamed;
@property (nonatomic, copy) NSString *question;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, assign) double cellHeight;
@property (nonatomic, assign) double time;
@property (nonatomic, assign) int supports;
@property (nonatomic, assign) int comments;
// 1 新闻类 2 话题讨论类 3 台词类
@property (nonatomic, assign) int type;

@end
