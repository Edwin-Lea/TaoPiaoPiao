//
//  TPPFileManager.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/5.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPFileManager.h"

@interface TPPFileManager()

@property (nonatomic, strong) NSFileManager *fileManager;

@end

@implementation TPPFileManager

// 单例模式
+ (instancetype)getInstance {
    static TPPFileManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[TPPFileManager alloc] init];
    });

    return manager;
}

- (instancetype)init {
    self = [super init];

    if (self) {
        _fileManager = [NSFileManager defaultManager];
    }

    return self;
}

/**
 * 返回文件内容得到的字典
 */
- (NSDictionary *)readDictionaryFromFile:(NSString *)filename {

    NSString *filePath = [[NSBundle mainBundle] pathForResource:filename ofType:@"plist"];

    NSLog(@"filepath : %@", filePath);

    return [NSDictionary dictionaryWithContentsOfFile:filePath];
}

@end
