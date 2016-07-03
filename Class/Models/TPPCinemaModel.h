//
//  TPPCinemaModel.h
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/3.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TPPCinemaModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, assign) double distance;
@property (nonatomic, assign) double minPrice;
@property (nonatomic, assign) int isOnSale;
@property (nonatomic, assign) int hallType;
@property (nonatomic, assign) int isSaved;

@end
