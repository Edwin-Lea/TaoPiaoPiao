//
//  TPPDiscoveryCommonView.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/4.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPDiscoveryCommonView.h"

@interface TPPDiscoveryCommonView()

@property (nonatomic, strong) UIButton *supportBtn;
@property (nonatomic, strong) UIButton *commentBtn;
@property (nonatomic, assign) int supports;
@property (nonatomic, assign) int comments;

@end

@implementation TPPDiscoveryCommonView

- (instancetype)initWithPoint:(CGPoint)point supports:(int)supports comments:(int)comments{
    self = [super init];

    if (self) {
        self.frame = CGRectMake(point.x, point.y, 105, 15);
        _supports = supports;
        _comments = comments;

        [self render];
    }

    return self;
}

- (void)render {
    [self addSubview:self.supportBtn];
    [self addSubview:self.commentBtn];
}

- (UIButton *)supportBtn {
    if (!_supportBtn) {
        _supportBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 52, 15)];
        [_supportBtn setTitle:[NSString stringWithFormat:@"%d", self.supports] forState:UIControlStateNormal];
        [_supportBtn setTitleColor:COLOR_RGB(138, 134, 158) forState:UIControlStateNormal];
        [_supportBtn setImage:[UIImage imageNamed:@"support.png"] forState:UIControlStateNormal];
        // TODO : 暂时没有激活时候图片
    }
    return _supportBtn;
}

- (UIButton *)commentBtn {
    if (!_commentBtn) {
        _commentBtn = [[UIButton alloc] initWithFrame:CGRectMake(52, 0, 52, 15)];
        [_commentBtn setTitle:[NSString stringWithFormat:@"%d", self.comments] forState:UIControlStateNormal];
        [_commentBtn setTitleColor:COLOR_RGB(138, 134, 158) forState:UIControlStateNormal];
        [_commentBtn setImage:[UIImage imageNamed:@"comment.png"] forState:UIControlStateNormal];
        // TODO : 暂时没有激活时候图片
    }

    return _commentBtn;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
