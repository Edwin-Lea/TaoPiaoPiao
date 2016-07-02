//
//  TPPFilmCell.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/2.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPFilmCell.h"
#import "TPPStarMarkView.h"
#import "TPPFilmModel.h"

@interface TPPFilmCell()

// 图片
@property (nonatomic, strong)UIImageView *image;
// 标题
@property (nonatomic, strong)UILabel *titleLabel;
// 评分
@property (nonatomic, strong)TPPStarMarkView *starMarkView;
// 小标题
@property (nonatomic, strong)UILabel *subTitleLabel;
// 导演
@property (nonatomic, strong)UILabel *directorLabel;
// 主演
@property (nonatomic, strong)UILabel *actorsLabel;
// 多少人想看
@property (nonatomic, strong)UILabel *wantsLabel;
// 按钮
@property (nonatomic, strong)UIButton *button;
// 渲染数据
@property (nonatomic, strong)TPPFilmModel *data;

@end

@implementation TPPFilmCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {

    }

    return self;
}

- (void)setData:(TPPFilmModel *)data {
    _data = data;
}

- (UIImageView *)image {
    if (!_image) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:];
    }
}

- (instancetype)renderCurrentHotSell {
    if (self.data) {
        // 构造出 正在上映cell
        [self.contentView addSubview:self.image];
        [self.contentView addSubview:self.titleLabel];
        return self;
    } else {
        return nil;
    }
}

- (instancetype)renderComingSoonSell {
    if (self.data) {
        // 构造出 即将上映cell
        [self.contentView addSubview:self.image];
        [self.contentView addSubview:self.titleLabel];
        return self;
    } else {
        return nil;
    }
}

- (instancetype)add3DTag {
    return self;
}

- (instancetype)add3DIMAXTag {
    return self;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
