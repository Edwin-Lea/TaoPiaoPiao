//
//  TPPCinemaCell.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/3.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPCinemaCell.h"
#import "TPPCinemaModel.h"

@interface TPPCinemaCell()

// 影院名称
@property (nonatomic, strong) UILabel *titleLabel;
// 地址
@property (nonatomic, strong) UILabel *addressLabel;
// 起看价
@property (nonatomic, strong) UILabel *minPriceLabel;
// 到当前的距离
@property (nonatomic, strong) UILabel *distanceLabel;
// 是否已经收藏
@property (nonatomic, strong) UIImageView *savedImage;
// 影厅类型
@property (nonatomic, strong) UILabel *hallTypeLabel;
// 是否是特惠
@property (nonatomic, strong) UILabel *isOnSale;
// 底部分割线
@property (nonatomic, strong) UIView *underline;

@property (nonatomic, strong) TPPCinemaModel *data;

@end

@implementation TPPCinemaCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {

    }

    return self;
}

- (void)setData:(TPPCinemaModel *)data {
    _data = data;
}

- (UIView *)underline {
    if (!_underline) {
        _underline = [[UIView alloc] initWithFrame:CGRectMake(15, 93.5, (SCREEN_WIDTH-15), 0.5)];
        _underline.backgroundColor = COLOR_RGB(226, 226, 226);
    }

    return _underline;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, 285, 16)];
        _titleLabel.text = self.data.title;
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = COLOR_RGB(45, 45, 45);
        // 自适应label长度
        [TextEnhance resizeUILabelWidth:_titleLabel];
    }

    return _titleLabel;
}

- (UILabel *)minPriceLabel {
    if (!_minPriceLabel) {
        double price = self.data.minPrice;
        _minPriceLabel = [[UILabel alloc] initWithFrame: CGRectMake((MaxX(self.titleLabel)+4), 19, 200, 13)];
        _minPriceLabel.text = [NSString stringWithFormat:@"%.1f", price];
        _minPriceLabel.font = [UIFont systemFontOfSize:12];
        _minPriceLabel.textColor = COLOR_RGB(255, 77, 100);
        // 宽度自适应
        [TextEnhance resizeUILabelWidth:_minPriceLabel];

        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(MaxX(_minPriceLabel), MinY(_minPriceLabel), 200, 13)];
        label.text = @"元起";
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = COLOR_RGB(154, 151, 171);
        // 宽度自适应
        [TextEnhance resizeUILabelWidth:label];

        [self.contentView addSubview:label];
    }

    return _minPriceLabel;
}

- (UILabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, (MaxY(self.titleLabel)+12), 285, 13)];
        _addressLabel.text = self.data.address;
        _addressLabel.font = [UIFont systemFontOfSize:12];
        _addressLabel.textColor = COLOR_RGB(154, 151, 171);
        // 宽度自适应
        [TextEnhance resizeUILabelWidth:_addressLabel];
    }

    return _addressLabel;
}

- (UILabel *)hallTypeLabel {
    if (!_hallTypeLabel) {
        _hallTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, (MaxY(self.addressLabel)+9), 40, 18)];
        _hallTypeLabel.font = [UIFont systemFontOfSize:9];
        _hallTypeLabel.textColor = COLOR_RGB(202, 44, 89);
        _hallTypeLabel.textAlignment = NSTextAlignmentCenter;
        _hallTypeLabel.layer.cornerRadius = 9;
        _hallTypeLabel.layer.borderWidth = 0.5;
        _hallTypeLabel.layer.borderColor = COLOR_RGB(202, 44, 89).CGColor;
        _hallTypeLabel.clipsToBounds = YES;
        switch (self.data.hallType) {
            case 1:
            {
                _hallTypeLabel.text = @"4D厅";
            }
                break;
            case 2:
            {
                _hallTypeLabel.text = @"IMAX";
            }
                break;
            default:
                break;
        }
    }

    return _hallTypeLabel;
}

- (UILabel *)isOnSale {
    if (!_isOnSale) {
        if (self.data.hallType) {
            _isOnSale = [[UILabel alloc] initWithFrame:CGRectMake((MaxY(self.hallTypeLabel)+4), MinY(self.hallTypeLabel), 36, 18)];
        } else {
            _isOnSale = [[UILabel alloc] initWithFrame:CGRectMake(15, (MaxY(self.addressLabel)+12), 36, 18)];
        }
        _isOnSale.font = [UIFont systemFontOfSize:9];
        _isOnSale.text = @"特惠";
        _isOnSale.textColor = COLOR_RGB(254, 166, 78);
        _isOnSale.textAlignment = NSTextAlignmentCenter;
        _isOnSale.layer.cornerRadius = 9;
        _isOnSale.layer.borderWidth = 0.5;
        _isOnSale.layer.borderColor = COLOR_RGB(254, 166, 78).CGColor;
        _isOnSale.clipsToBounds = YES;
    }

    return _isOnSale;
}

- (UILabel *)distanceLabel {
    if (!_distanceLabel) {
        _distanceLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-200), (94-11)/2, 200, 11)];
        _distanceLabel.text = [NSString stringWithFormat:@"%.1fkm", self.data.distance];
        _distanceLabel.textColor = COLOR_RGB(154, 151, 171);
        _distanceLabel.font = [UIFont systemFontOfSize:10];
        // 自适应宽度
        [TextEnhance resizeUILabelWidth:_distanceLabel];
        // 调整位置
        CGRect rect = _distanceLabel.frame;
        rect.origin.x = (SCREEN_WIDTH-_distanceLabel.frame.size.width-12);
        _distanceLabel.frame = rect;
    }

    return _distanceLabel;
}

- (UIImageView *)savedImage {
    if (!_savedImage) {
        _savedImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lasted_cinema.png"]];
        _savedImage.frame = CGRectMake((SCREEN_WIDTH-42), 0, 42, 42);
    }

    return _savedImage;
}

- (instancetype)render {
    // TODO : 渲染界面 判断hallType和isOnSale

    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.addressLabel];
    [self.contentView addSubview:self.distanceLabel];
    [self.contentView addSubview:self.minPriceLabel];
    [self.contentView addSubview:self.underline];
    if (self.data.hallType) {
        [self.contentView addSubview:self.hallTypeLabel];
    }
    if (self.data.isOnSale) {
        [self.contentView addSubview:self.isOnSale];
    }
    if (self.data.isSaved) {
        [self.contentView addSubview:self.savedImage];
    }

    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
