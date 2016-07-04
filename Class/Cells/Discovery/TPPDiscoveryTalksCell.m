//
//  TPPDiscoveryTalksCell.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/3.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPDiscoveryTalksCell.h"
#import "TPPDiscoveryCommonView.h"
#import "TPPDiscoveryModel.h"

@interface TPPDiscoveryTalksCell()

@property (nonatomic, strong) UIImageView *talksImage;
@property (nonatomic, strong) UILabel *typeLabel;
@property (nonatomic, strong) UILabel *questionLabel;
@property (nonatomic, strong) UILabel *joinLabel;
@property (nonatomic, strong) UIImageView *shareImage;
@property (nonatomic, strong) TPPDiscoveryCommonView *commonView;
@property (nonatomic, strong) UIView *underline;
@property (nonatomic, strong) TPPDiscoveryModel *data;

@end

@implementation TPPDiscoveryTalksCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        // 删除选中效果
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    return self;
}

- (void)setData:(TPPDiscoveryModel *)data {
    _data = data;
}

- (instancetype)render {
    [self addSubview:self.talksImage];
    [self addSubview:self.typeLabel];
    [self addSubview:self.questionLabel];
    [self addSubview:self.joinLabel];
    [self addSubview:self.shareImage];
    [self addSubview:self.commonView];
    [self addSubview:self.underline];
    return self;
}

- (UIImageView *)talksImage {
    if (!_talksImage) {
        _talksImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.data.imageNamed]];
        _talksImage.frame = CGRectMake(15, 15, (SCREEN_WIDTH-30), _talksImage.image.size.height/2);

        // 加上遮罩
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, (SCREEN_WIDTH-30), _talksImage.image.size.height/2)];
        view.backgroundColor = COLOR_RGBA(0, 0, 0, 0.4);
        [_talksImage addSubview:view];
    }

    return _talksImage;
}

- (UILabel *)questionLabel {
    if (!_questionLabel) {
        _questionLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-280)/2, (CGFloat)((self.data.cellHeight-40)/2), 275, 40)];
        _questionLabel.text = self.data.question;
        _questionLabel.textColor = [UIColor whiteColor];
        _questionLabel.textAlignment = NSTextAlignmentCenter;
        _questionLabel.numberOfLines = 2;
        _questionLabel.font = [UIFont systemFontOfSize:16];
    }

    return _questionLabel;
}

- (UILabel *)typeLabel {
    if (!_typeLabel) {
        _typeLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-50)/2, (MinY(self.questionLabel)-30), 50, 20)];
        _typeLabel.text = @"话题讨论";
        _typeLabel.textColor = [UIColor blackColor];
        _typeLabel.font = [UIFont systemFontOfSize:10];
        _typeLabel.textAlignment = NSTextAlignmentCenter;
        _typeLabel.backgroundColor = [UIColor whiteColor];
        _typeLabel.layer.cornerRadius = 5;
        _typeLabel.clipsToBounds = YES;
    }
    return _typeLabel;
}

- (UILabel *)joinLabel {
    if (!_joinLabel) {
        _joinLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, (MaxY(self.questionLabel)+18), 400, 15)];
        _joinLabel.text = [NSString stringWithFormat:@"%d人参与讨论", self.data.comments];
        _joinLabel.textColor = [UIColor whiteColor];
        _joinLabel.font = [UIFont systemFontOfSize:12];
        // 自适应长度
        [TextEnhance resizeUILabelWidth:_joinLabel];
        CGRect rect = _joinLabel.frame;
        rect.origin.x = (SCREEN_WIDTH-_joinLabel.frame.size.width)/2;
        _joinLabel.frame = rect;
    }
    return _joinLabel;
}

- (TPPDiscoveryCommonView *)commonView {
    if (!_commonView) {
        _commonView = [[TPPDiscoveryCommonView alloc] initWithPoint:CGPointMake((SCREEN_WIDTH-120), (CGFloat)(self.data.cellHeight-32)) supports:self.data.supports comments:self.data.comments];
        CGRect rect = _commonView.frame;
        rect.origin.x = (SCREEN_WIDTH-_commonView.frame.size.width-15);
        _commonView.frame = rect;
    }
    return _commonView;
}

- (UIImageView *)shareImage {
    if (!_shareImage) {
        _shareImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"share.png"]];
        _shareImage.frame = CGRectMake(15, (CGFloat)(self.data.cellHeight-32), 15, 15);
    }

    return _shareImage;
}

- (UIView *)underline {
    if (!_underline) {
        _underline = [[UIView alloc] initWithFrame:CGRectMake(0, (CGFloat)(self.data.cellHeight-0.5), SCREEN_WIDTH, 0.5)];
        _underline.backgroundColor = COLOR_RGB(226, 226, 226);
    }

    return _underline;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
