//
//  TPPDiscoveryNewsCell.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/3.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPDiscoveryNewsCell.h"
#import "TPPDiscoveryModel.h"
#import "TPPDiscoveryCommonView.h"

@interface TPPDiscoveryNewsCell()

@property (nonatomic, strong) UILabel *questionLabel;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) UILabel *categoryLabel;
@property (nonatomic, strong) UIImageView *newsImage;
@property (nonatomic, strong) TPPDiscoveryCommonView *commonView;
@property (nonatomic, strong) UIView *underline;
@property (nonatomic, strong) TPPDiscoveryModel *data;

@end

@implementation TPPDiscoveryNewsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {

    }

    return self;
}

- (void)setData:(TPPDiscoveryModel *)data {
    _data = data;
}

- (instancetype)render {
    [self addSubview:self.questionLabel];
    [self addSubview:self.descLabel];
    [self addSubview:self.categoryLabel];
    [self addSubview:self.newsImage];
    [self addSubview:self.commonView];
    [self addSubview:self.underline];
    return self;
}

- (UILabel *)questionLabel {
    if (!_questionLabel) {
        _questionLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, 200, 50)];
        _questionLabel.text = self.data.question;
        _questionLabel.textColor = COLOR_RGB(34, 34, 39);
        _questionLabel.font = [UIFont systemFontOfSize:18];
        _questionLabel.numberOfLines = 2;
        _questionLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }

    return _questionLabel;
}

- (UILabel *)descLabel {
    if (!_descLabel) {
        _descLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, (MaxY(self.questionLabel)+12), 200, 50)];
        _descLabel.text = self.data.desc;
        _descLabel.textColor = COLOR_RGB(138, 134, 158);
        _descLabel.font = [UIFont systemFontOfSize:13];
        _descLabel.numberOfLines = 2;
        _descLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }

    return _descLabel;
}

- (UIImageView *)newsImage {
    if (!_newsImage) {
        _newsImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.data.imageNamed]];
        _newsImage.frame = CGRectMake((SCREEN_WIDTH-95-15),  20, 95, 45);
    }

    return _newsImage;
}

- (UILabel *)categoryLabel {
    if (!_categoryLabel) {
        _categoryLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, (SCREEN_HEIGHT-32), 200, 15)];
        _categoryLabel.text = self.data.category;
        _categoryLabel.textColor = COLOR_RGB(138, 134, 158);;
        _categoryLabel.font = [UIFont systemFontOfSize:12];
    }

    return _categoryLabel;
}

- (TPPDiscoveryCommonView *)commonView {
    if (!_commonView) {
        _commonView = [[TPPDiscoveryCommonView alloc] initWithPoint:CGPointMake((SCREEN_WIDTH-110-15), (MaxY(self.imageView)+18)) supports:self.data.supports comments:self.data.comments];
    }

    return _commonView;
}

- (UIView *)underline {
    if (!_underline) {
        _underline = [[UIView alloc] initWithFrame:CGRectMake(15, 164.5, SCREEN_WIDTH-15, 0.5)];
        _underline.backgroundColor = COLOR_RGB(226, 226, 226);
    }

    return _underline;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
