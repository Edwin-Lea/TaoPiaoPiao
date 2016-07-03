//
//  TPPDamaiModel.h
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/3.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TPPDamaiModel : NSObject

// 图片
@property (nonatomic, copy) NSString *image;
// 演出名称
@property (nonatomic, copy) NSString *title;
// 票价最低价格
@property (nonatomic, assign) double minPrice;
// 票价最高价格
@property (nonatomic, assign) double maxPrice;
// 所属分类名称
@property (nonatomic, copy) NSString *categoryName;
// 时间
@property (nonatomic, assign) double time;
// 地点
@property (nonatomic, copy) NSString *location;
// 关键信息
@property (nonatomic, copy) NSString *keyWords;
// 是否有关键信息
@property (nonatomic, assign) BOOL hasKeyWorkds;

@end
