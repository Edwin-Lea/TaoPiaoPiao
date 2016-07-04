//
//  TPPDiscoveryLinesCell.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/3.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPDiscoveryLinesCell.h"
#import "TPPDiscoveryModel.h"
#import "TPPDiscoveryCommonView.h"

@interface TPPDiscoveryLinesCell()

@property (nonatomic, strong) UIImageView *linesImage;
@property (nonatomic, strong) UIImageView *sharedImage;
@property (nonatomic, strong) UIImageView *movieImage;
@property (nonatomic, strong) TPPDiscoveryCommonView *commonView;
@property (nonatomic, strong) UIView *underline;
@property (nonatomic, strong) TPPDiscoveryModel *data;

@end

@implementation TPPDiscoveryLinesCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    return self;
}

- (void)setData:(TPPDiscoveryModel *)data {
    _data = data;
}

- (instancetype)render {

    [self addSubview:self.linesImage];
    [self addSubview:self.sharedImage];
    [self addSubview:self.movieImage];
    [self addSubview:self.commonView];
    [self addSubview:self.underline];

    return self;
}

- (UIImageView *)linesImage {
    if (!_linesImage) {
        _linesImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.data.imageNamed]];
        _linesImage.frame = CGRectMake(15, 15, SCREEN_WIDTH-30, _linesImage.image.size.height/2);
    }

    return _linesImage;
}

- (UIImageView *)sharedImage {
    if (!_sharedImage) {
        _sharedImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"share.png"]];
        _sharedImage.frame = CGRectMake(15, (CGFloat)(self.data.cellHeight-32), 15, 15);
    }

    return _sharedImage;
}

- (UIImageView *)movieImage {
    if (!_movieImage) {
        _movieImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"movie.png"]];
        _movieImage.frame = CGRectMake((MaxX(self.sharedImage)+20), (CGFloat)(self.data.cellHeight-32), 15, 15);
    }

    return _movieImage;
}

- (UIView *)underline {
    if (!_underline) {
        _underline = [[UIView alloc] initWithFrame:CGRectMake(0, (CGFloat)(self.data.cellHeight-0.5), SCREEN_WIDTH, 0.5)];
        _underline.backgroundColor =COLOR_RGB(226, 226, 226);
    }

    return _underline;
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


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
