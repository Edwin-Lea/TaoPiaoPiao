//
//  TPPStarMarkView.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/2.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPStarMarkView.h"

#define SHARE_STAR_WIDTH (54/2)
#define SHARE_STAR_HEIGHT (45/2)

@implementation TPPStarMarkView

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {

    }

    return self;
}

- (instancetype)initWithFrame:(CGRect)frame mark:(CGFloat)mark {
    self = [super initWithFrame:frame];
    if (self) {
        _mark = mark;

        [self renderStartWithMark];
    }

    return self;
}

- (instancetype)render {
    [self renderStartWithMark];

    return self;
}

/**
 * 根据分数渲染星星
 */
- (void)renderStartWithMark {
    CGFloat mark = _mark;
    int fullStarNum = (int)floor(mark/2);
    for (int i = 0; i < 5; ++i) {
        UIImageView *imageView = [[UIImageView alloc] init];
        if (i < fullStarNum) {
            imageView.image = [UIImage imageNamed:@"star_for_share_full.png"];
        } else {
            imageView.image = [UIImage imageNamed:@"star_for_share_empty.png"];
        }

        imageView.frame = CGRectMake(SHARE_STAR_WIDTH*i, 0, SHARE_STAR_WIDTH, SHARE_STAR_HEIGHT);

        [self addSubview:imageView];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
