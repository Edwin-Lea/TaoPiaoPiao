//
//  TPPFilmModel.h
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/2.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TPPFilmModel : NSObject

// 电影主title
@property (nonatomic, copy) NSString *title;
// 电影英语title
@property (nonatomic, copy) NSString *enTitle;
// 电影副title
@property (nonatomic, copy) NSString *subTitle;
// 电影图片
@property (nonatomic, copy) NSString *image;
// 电影评分
@property (nonatomic, assign) double mark;
// 电影上映时间
@property (nonatomic, assign) double time;
// 电影当前状态0 : 无  1 特别推荐 2 今日最热 3 特别推荐
@property (nonatomic, assign) double tagType;
// 电影类型 0 无 1 3D 2 3DIMAX
@property (nonatomic, assign) double titleTag;
// 电影导演
@property (nonatomic, copy) NSString *director;
// 电影演员
@property (nonatomic, copy) NSString *actors;
// 电影类型
@property (nonatomic, copy) NSString *type;
// 电影产地
@property (nonatomic, copy) NSString *country;
// 电影语种
@property (nonatomic, copy) NSString *language;
// 电影时长
@property (nonatomic, copy) NSString *longTime;
// 电影内容简介
@property (nonatomic, copy) NSString *intro;

@end
