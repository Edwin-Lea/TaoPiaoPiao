//
//  TPPFilmActivityCell.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/2.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPFilmActivityCell.h"
#import "TPPFilmActivityModel.h"

@interface TPPFilmActivityCell()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *introLabel;
@property (nonatomic, strong) UIView *underline;
@property (nonatomic, strong) UIView *separationLine;

@end

@implementation TPPFilmActivityCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 40);
    }

    return self;
}

- (void)setData:(TPPFilmActivityModel *)data {
    _data = data;
}

- (UIView *)underline {
    if (!_underline){
        _underline = [[UIView alloc] initWithFrame:CGRectMake(90, 0, (SCREEN_WIDTH-90), 0.5)];
        _underline.backgroundColor = COLOR_RGB(226, 226, 226);
    }

    return _underline;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 10, SCREEN_WIDTH, 13)];
        _nameLabel.text = self.data.name;
        _nameLabel.textColor = COLOR_RGB(254, 165, 76);
        _nameLabel.font = [UIFont systemFontOfSize:12];
        // 调整宽度
        [TextEnhance resizeUILabelWidth:_nameLabel];
    }

    return _nameLabel;
}

- (UIView *)separationLine {
    if (!_separationLine) {
        _separationLine = [[UIView alloc] initWithFrame:CGRectMake((MaxX(self.nameLabel)+10), 13, 1, 11)];
        _separationLine.backgroundColor = COLOR_RGB(226, 226, 226);
    }

    return _separationLine;
}

- (UILabel *)introLabel {
    if (!_introLabel) {
        _introLabel = [[UILabel alloc] initWithFrame:CGRectMake((MaxX(self.separationLine)+10), 10, (SCREEN_WIDTH-(MaxX(self.separationLine)+10)), 13)];
        _introLabel.text = self.data.intro;
        _introLabel.textColor = COLOR_RGB(138, 134, 158);
        _introLabel.font = [UIFont systemFontOfSize:12];
        // 调整宽度
        [TextEnhance resizeUILabelWidth:_introLabel];
    }

    return _introLabel;
}

- (instancetype)render {

    [self addSubview:self.underline];
    [self addSubview:self.nameLabel];
    [self addSubview:self.separationLine];
    [self addSubview:self.introLabel];

    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
