//
//  TPPDamaiCell.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/3.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPDamaiCell.h"
#import "TPPDamaiModel.h"

@interface TPPDamaiCell()

@property (nonatomic, strong) UIImageView* myImage;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *timeAndCategoryLabel;
@property (nonatomic, strong) UILabel *addressLabel;
@property (nonatomic, strong) UILabel *keyWordsView;
@property (nonatomic, strong) UIView *underline;
@property (nonatomic, strong) TPPDamaiModel *data;

@end

@implementation TPPDamaiCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {

    }

    return self;
}

- (void)setData:(TPPDamaiModel *)data {
    _data = data;
}

- (instancetype)render {

    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.timeAndCategoryLabel];
    [self.contentView addSubview:self.addressLabel];
    if (self.data.hasKeyWorkds) {
        [self.contentView addSubview:self.keyWordsView];
    }
    [self.contentView addSubview:self.underline];

    return self;
}

- (UIImageView *)imageView {
    if (!_myImage) {
        _myImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.data.image]];
        _myImage.frame = CGRectMake(19, 18, 78, 105);
    }

    return _myImage;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake((MaxX(self.imageView)+10), MinY(self.imageView), 245, 40)];
        _titleLabel.numberOfLines = 2;
        _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _titleLabel.font = [UIFont systemFontOfSize:16];
        NSString *strPrice = [NSString stringWithFormat:@"%d元 - %d元", (int)self.data.minPrice, (int)self.data.maxPrice];
        NSString *strTitle = self.data.title;
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ %@", strTitle, strPrice]];
        [string setAttributes:@{NSForegroundColorAttributeName: COLOR_RGB(34, 34, 39)} range:NSMakeRange(0, strTitle.length)];
        [string setAttributes:@{NSForegroundColorAttributeName: COLOR_RGB(255, 77, 100)} range:NSMakeRange((strTitle.length+1), strPrice.length)];
        _titleLabel.attributedText = string;
    }

    return _titleLabel;
}

- (UILabel *)timeAndCategoryLabel {
    if (!_timeAndCategoryLabel) {
        _timeAndCategoryLabel = [[UILabel alloc] initWithFrame:CGRectMake(MinX(self.titleLabel), (MaxY(self.titleLabel)+20), 245, 15)];
        _timeAndCategoryLabel.font = [UIFont systemFontOfSize:14];
        _timeAndCategoryLabel.textColor = COLOR_RGB(158, 154, 174);

        NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.data.time];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy.MM.dd";
        _timeAndCategoryLabel.text = [NSString stringWithFormat:@"%@ | %@", self.data.categoryName, [formatter stringFromDate:date]];
    }

    return _timeAndCategoryLabel;
}

- (UILabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(MinX(self.titleLabel), (MaxY(self.timeAndCategoryLabel)+10), 245, 15)];
        _addressLabel.font = [UIFont systemFontOfSize:14];
        _addressLabel.text = self.data.location;
        _addressLabel.textColor = COLOR_RGB(158, 154, 174);
    }

    return _addressLabel;
}

- (UILabel *)keyWordsView {
    if (!_keyWordsView) {
        _keyWordsView = [[UILabel alloc] initWithFrame:CGRectMake(MinX(self.titleLabel), 137, (SCREEN_WIDTH-MinX(self.titleLabel)), 47)];
        _keyWordsView.text = self.data.keyWords;
        _keyWordsView.textColor = COLOR_RGB(158, 154, 174);
        _keyWordsView.font = [UIFont systemFontOfSize:14];

        // 添加线
        UIView *underline = [[UIView alloc] initWithFrame:CGRectMake(0, 0, (SCREEN_WIDTH-MinX(self.addressLabel)), 1)];
        underline.backgroundColor = COLOR_RGB(243, 243, 243);

        [_keyWordsView addSubview:underline];
    }

    return _keyWordsView;
}

- (UIView *)underline {
    if (!_underline) {
        if (self.data.hasKeyWorkds) {
            _underline = [[UIView alloc] initWithFrame:CGRectMake(MinX(self.myImage), 183, (SCREEN_WIDTH-MinX(self.myImage)), 1)];
        } else {
            _underline = [[UIView alloc] initWithFrame:CGRectMake(MinX(self.myImage), 136, (SCREEN_WIDTH-MinX(self.myImage)), 1)];
        }
        _underline.backgroundColor = COLOR_RGB(243, 243, 243);
    }

    return _underline;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
