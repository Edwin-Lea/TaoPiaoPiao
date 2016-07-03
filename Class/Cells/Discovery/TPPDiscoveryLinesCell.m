//
//  TPPDiscoveryLinesCell.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/3.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPDiscoveryLinesCell.h"
#import "TPPDiscoveryCommonView.h"
#import "TPPDiscoveryModel.h"

@interface TPPDiscoveryLinesCell()

@property (nonatomic, strong) UILabel *typeLabel;
@property (nonatomic, strong) UILabel *questionLabel;
@property (nonatomic, strong) UILabel *joinLabel;
@property (nonatomic, strong) UIImageView *shareImage;
@property (nonatomic, strong) TPPDiscoveryCommonView *commonView;
@property (nonatomic, strong) UIView *underline;
@property (nonatomic, strong) TPPDiscoveryModel *data;

@end

@implementation TPPDiscoveryLinesCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {

    }

    return self;
}

- (void)setData:(TPPDiscoveryModel *)data {
    _data = data;
    // 修改图片高度
    UIImage *image = [UIImage imageNamed:data.imageNamed];

    data.cellHeight = (image.size.height+65);
}

- (instancetype)render {
    [self addSubview:self.typeLabel];
    [self addSubview:self.questionLabel];
    [self addSubview:self.joinLabel];
    [self addSubview:self.shareImage];
    [self addSubview:self.commonView];
    return self;
}

- (UILabel *)questionLabel {
    if (!_questionLabel) {
        _questionLabel = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-280)/2, self.data.cellHeight, , )];
    }

    return _questionLabel;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
