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
#import "DateEnhance.h"

@interface TPPFilmCell()

// 图片
@property (nonatomic, strong)UIImageView *filmImage;
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
// 线
@property (nonatomic, strong)UIView *underline;
// 按钮
@property (nonatomic, strong)UIButton *button;
// 渲染数据
@property (nonatomic, strong)TPPFilmModel *data;

@end

@implementation TPPFilmCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 113);
    }

    return self;
}

- (void)setData:(TPPFilmModel *)data {
    _data = data;
}

- (UIImageView *)filmImage {
    if (!_filmImage) {
        _filmImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.data.image]];
        _filmImage.frame = CGRectMake(15, 15, 65, 90);
    }
    return _filmImage;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake((MaxX(self.filmImage)+10), 16, 215, 18)];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.text = self.data.title;
        [_titleLabel setTextColor:COLOR_RGB(34, 34, 39)];
        // 自适应UILabel宽度
        [TextEnhance resizeUILabelWidth:_titleLabel];
    }

    return _titleLabel;
}

- (TPPStarMarkView *)starMarkView {
    if (!_starMarkView) {
        _starMarkView = [[TPPStarMarkView alloc] initWithPoint:CGPointMake(MinX(self.titleLabel), (MaxY(self.titleLabel)+10)) mark:self.data.mark];
    }

    return _starMarkView;
}

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(MinX(self.titleLabel), (MaxY(self.starMarkView)+13), 215, 14)];
        _subTitleLabel.font = [UIFont systemFontOfSize:13];
        _subTitleLabel.text = self.data.subTitle;
        [_subTitleLabel setTextColor:COLOR_RGB(138, 134, 158)];
        // 自适应UILabel宽度
        [TextEnhance resizeUILabelWidth:_subTitleLabel];
    }

    return _subTitleLabel;
}

- (UILabel *)actorsLabel {
    if (!_actorsLabel) {
        _actorsLabel = [[UILabel alloc] initWithFrame:CGRectMake(MinX(self.titleLabel), (MaxY(self.subTitleLabel)+3), 215, 14)];
        _actorsLabel.font = [UIFont systemFontOfSize:13];
        _actorsLabel.text = self.data.actors;
        [_actorsLabel setTextColor:COLOR_RGB(138, 134, 158)];
        // 自适应UILabel宽度
        [TextEnhance resizeUILabelWidth:_actorsLabel];
    }

    return _actorsLabel;
}

- (UIButton *)button {
    if (!_button) {
        NSDate *nowDate = [NSDate date];
        NSDate *date = [DateEnhance getDate:self.data.time];
        _button = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-60), (MaxY(self.starMarkView)+5), 45, 25)];
        _button.layer.borderWidth = 1;
        _button.layer.cornerRadius = 2.5;
        _button.backgroundColor = [UIColor clearColor];
        _button.titleLabel.font = [UIFont systemFontOfSize:12];
        if ([nowDate compare:date] == NSOrderedAscending)
        {
            // 预售
            [_button setTitle:@"预售" forState:UIControlStateNormal];
            _button.tag = 1;
            _button.layer.borderColor = COLOR_RGB(0, 161, 224).CGColor;
            [_button setTitleColor:COLOR_RGB(0, 161, 224) forState:UIControlStateNormal];
            [_button addTarget:self action:@selector(btnClickDownHandler:) forControlEvents:UIControlEventTouchDown];
            [_button addTarget:self action:@selector(btnClickUpHandler:) forControlEvents:UIControlEventTouchUpInside];
        } else {
            // 购票
            [_button setTitle:@"购票" forState:UIControlStateNormal];
            _button.tag = 2;
            _button.layer.borderColor = COLOR_RGB(255, 77, 100).CGColor;
            [_button setTitleColor:COLOR_RGB(255, 77, 100) forState:UIControlStateNormal];
            [_button addTarget:self action:@selector(btnClickDownHandler:) forControlEvents:UIControlEventTouchDown];
            [_button addTarget:self action:@selector(btnClickUpHandler:) forControlEvents:UIControlEventTouchUpInside];
        }
    }

    return _button;
}

- (UILabel *)wantsLabel {
    if (!_wantsLabel) {
        _wantsLabel = [[UILabel alloc] initWithFrame:CGRectMake(MinX(self.titleLabel), (MaxY(self.titleLabel)+4), 210, 11)];
        _wantsLabel.text = [NSString stringWithFormat:@"%d人想看", (int)self.data.wants];
        _wantsLabel.font = [UIFont systemFontOfSize:10];
        [_wantsLabel setTextColor:COLOR_RGB(254, 165, 76)];
        // 自适应UILabel宽度
        [TextEnhance resizeUILabelWidth:_wantsLabel];
    }

    return _wantsLabel;
}

/**
 * 设定导演字标
 */
- (UILabel *)directorLabel {
    if (!_directorLabel) {
        _directorLabel = [[UILabel alloc] initWithFrame:CGRectMake(MinX(self.titleLabel), (MaxY(self.wantsLabel)+13), 215, 14)];
        _directorLabel.font = [UIFont systemFontOfSize:13];
        _directorLabel.text = [NSString stringWithFormat:@"导演: %@", self.data.director];
        [_directorLabel setTextColor:COLOR_RGB(138, 134, 158)];
        // 自适应UILabel宽度
        [TextEnhance resizeUILabelWidth:_directorLabel];
    }

    return _directorLabel;
}

/**
 * 具有主演 字标 的actorsLabel方法
 */
- (UILabel *)actorsLabelS {
    if (!_actorsLabel) {
        _actorsLabel = [[UILabel alloc] initWithFrame:CGRectMake(MinX(self.titleLabel), (MaxY(self.directorLabel)+3), 215, 14)];
        _actorsLabel.font = [UIFont systemFontOfSize:13];
        _actorsLabel.text = [NSString stringWithFormat:@"主演: %@", self.data.actors];
        [_actorsLabel setTextColor:COLOR_RGB(138, 134, 158)];
        // 自适应UILabel宽度
        [TextEnhance resizeUILabelWidth:_actorsLabel];
    }

    return _actorsLabel;
}

- (UIView *)underline{
    if (!_underline) {
        _underline = [[UIView alloc] initWithFrame:CGRectMake(15, 0, (SCREEN_WIDTH-15), 0.5)];
        _underline.backgroundColor =  COLOR_RGB(226, 226, 226);
    }

    return _underline;
}

- (instancetype)renderCurrentHotSell {
    if (self.data) {
        // 构造出 正在上映cell
        [self.contentView addSubview:self.underline];
        [self.contentView addSubview:self.filmImage];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.button];

        [self.contentView addSubview:self.starMarkView];
        [self.contentView addSubview:self.subTitleLabel];
        [self.contentView addSubview:self.actorsLabel];

        [self addTag];
        [self addRibbon];
        return self;
    } else {
        return nil;
    }
}

- (instancetype)renderComingSoonSell {
    if (self.data) {
        // 构造出 即将上映cell
        [self.contentView addSubview:self.underline];
        [self.contentView addSubview:self.filmImage];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.button];

        [self.contentView addSubview:self.wantsLabel];
        [self.contentView addSubview:self.directorLabel];
        [self.contentView addSubview:[self actorsLabelS]];
        [self addTag];
        return self;
    } else {
        return nil;
    }
}

- (void)addRibbon {
    UIImageView *ribbonImage = [[UIImageView alloc] init];
    ribbonImage.frame = CGRectMake((SCREEN_WIDTH-50), 0, 23, 30);
    switch (self.data.ribbonType) {
        case 1:
        {
            ribbonImage.image = [UIImage imageNamed:@"ribbon_mark_remind.png"];
        }
            break;
        case 2:
        {
            ribbonImage.image = [UIImage imageNamed:@"ribbon_mark_today.png"];
        }
            break;
        case 4:
        {
            ribbonImage.image = [UIImage imageNamed:@"ribbon_mark_best.png"];
        }
            break;
        case 8:
        {
            ribbonImage.image = [UIImage imageNamed:@"ribbon_hottest_weekly.png"];
        }
            break;
        default:
            break;
    }

    [self.contentView addSubview:ribbonImage];
}

- (void)addTag {
    switch (self.data.tagType) {
        case 1:
        {
            [self add3DTag];
        }
            break;
        case 2:
        {
            [self add3DIMAXTag];
        }
            break;
        default:
            break;
    }
}

- (void)add3DTag {
    UILabel *tag = [[UILabel alloc] initWithFrame:CGRectMake((MaxX(self.titleLabel)+6), MinY(self.titleLabel)+2, 17, 13)];
    tag.layer.borderWidth = 1;
    tag.layer.borderColor = COLOR_RGB(185, 183, 197).CGColor;
    tag.layer.cornerRadius = 2;
    tag.backgroundColor = COLOR_RGB(185, 183, 197);
    tag.text = @"3D";
    tag.textAlignment = NSTextAlignmentCenter;
    tag.textColor = [UIColor whiteColor];
    tag.font = [UIFont systemFontOfSize:6];
    tag.clipsToBounds = YES;

    [self.contentView addSubview:tag];
}

- (void)add3DIMAXTag {

    UIView *tag = [[UIView alloc] initWithFrame:CGRectMake((MaxX(self.titleLabel)+6), MinY(self.titleLabel)+2, 45, 13)];
    tag.backgroundColor = COLOR_RGB(185, 183, 197);
    tag.layer.borderWidth = 1;
    tag.layer.borderColor = COLOR_RGB(185, 183, 197).CGColor;
    tag.layer.cornerRadius = 2;

    UILabel *leftPart = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 15, 13)];
    leftPart.layer.borderWidth = 1;
    leftPart.layer.borderColor = COLOR_RGB(185, 183, 197).CGColor;
    leftPart.layer.cornerRadius = 2;
    leftPart.backgroundColor = [UIColor clearColor];
    leftPart.text = @"3D";
    leftPart.textAlignment = NSTextAlignmentCenter;
    leftPart.textColor = [UIColor whiteColor];
    leftPart.font = [UIFont systemFontOfSize:6];

    UILabel *rightPart = [[UILabel alloc] initWithFrame:CGRectMake(17, 0, 28, 13)];
    rightPart.backgroundColor = [UIColor whiteColor];
    rightPart.text = @"IMAX";
    rightPart.textAlignment = NSTextAlignmentCenter;
    rightPart.textColor = COLOR_RGB(185, 183, 197);
    rightPart.font = [UIFont systemFontOfSize:6];


    [tag addSubview:leftPart];
    [tag addSubview:rightPart];

    [self.contentView addSubview:tag];
}

- (void)btnClickDownHandler:(id)sender {
    if (sender && [sender isKindOfClass:[UIButton class]]) {
        UIButton *btn = (UIButton *)sender;
        switch (btn.tag) {
            case 1:
            {
                // 预售
                btn.backgroundColor = COLOR_RGB(0, 161, 224);
                [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
            }
                break;
            case 2:
            {
                // 购买
                btn.backgroundColor = COLOR_RGB(255, 77, 100);
                [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
            }
                break;
            default:
                break;
        }
    }
}

- (void)btnClickUpHandler:(id)sender {
    if (sender && [sender isKindOfClass:[UIButton class]]) {
        UIButton *btn = (UIButton *)sender;
        switch (btn.tag) {
            case 1:
            {
                // 预售
                btn.backgroundColor = [UIColor whiteColor];
            }
                break;
            case 2:
            {
                // 购买
                btn.backgroundColor = [UIColor whiteColor];
            }
                break;
            default:
                break;
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
