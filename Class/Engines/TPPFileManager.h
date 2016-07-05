//
//  TPPFileManager.h
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/5.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TPPFileManager : NSObject

// 单例模式
+ (instancetype)getInstance;

- (NSDictionary *)readDictionaryFromFile:(NSString *)filename;

@end
