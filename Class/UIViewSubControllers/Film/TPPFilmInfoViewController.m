//
//  TPPFilmInfoViewController.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/5.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "TPPFilmInfoViewController.h"
#import "TPPFilmModel.h"
#import "ImageEnhance.h"


@interface TPPFilmInfoViewController()

@property (nonatomic, strong) UIImageView *filmImage;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) TPPFilmModel *model;

@end

@implementation TPPFilmInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (instancetype)initWithModel:(TPPFilmModel *)model {
    self = [super init];

    if (self) {
        _model = model;

        self.title = model.title;

        self.navigationItem.titleView.alpha = 0.0;

        [self render];
    }

    return self;
}

- (instancetype)init {
    self = [super init];

    if (self) {

    }

    return self;
}

- (void) render {

    [self.view addSubview:self.filmImage];
    [self.view addSubview:self.imageView];

}

- (UIImageView *)filmImage {
    if (!_filmImage) {
        _filmImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.model.image]];
        _filmImage.frame = CGRectMake(0, -64, SCREEN_WIDTH, 250);
        [ImageEnhance createBlurBackground:_filmImage];
    }

    return _filmImage;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.model.image]];
        _imageView.frame = CGRectMake(20, 36,  110, 150);
    }

    return _imageView;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
