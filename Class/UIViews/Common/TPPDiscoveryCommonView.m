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

    // 修正宽度
    CGRect rect = self.frame;
    rect.size.width = (self.supportBtn.frame.size.width+self.commentBtn.frame.size.width+10);
    self.frame = rect;
}

- (UIButton *)supportBtn {
    if (!_supportBtn) {
        _supportBtn = [[UIButton alloc] init];

        NSString *title = [NSString stringWithFormat:@"%d", self.supports];
        _supportBtn.frame = CGRectMake(0, 0, (20+13*title.length), 15);
        [_supportBtn setTitle: title forState:UIControlStateNormal];
        [_supportBtn setTitleColor:COLOR_RGB(138, 134, 158) forState:UIControlStateNormal];
        [_supportBtn setImage:[UIImage imageNamed:@"support.png"] forState:UIControlStateNormal];

        _supportBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_supportBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];

        // TODO : 暂时没有激活时候图片
    }
    return _supportBtn;
}

- (UIButton *)commentBtn {
    if (!_commentBtn) {
        _commentBtn = [[UIButton alloc] init];

        NSString *title = [NSString stringWithFormat:@"%d", self.comments];
        _commentBtn.frame = CGRectMake((self.supportBtn.frame.size.width+8), 0, (20+13*title.length), 15);
        [_commentBtn setTitle:[NSString stringWithFormat:@"%d", self.comments] forState:UIControlStateNormal];
        [_commentBtn setTitleColor:COLOR_RGB(138, 134, 158) forState:UIControlStateNormal];
        [_commentBtn setImage:[UIImage imageNamed:@"comment.png"] forState:UIControlStateNormal];

        _commentBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_commentBtn.imageView setContentMode:UIViewContentModeScaleAspectFit];

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
