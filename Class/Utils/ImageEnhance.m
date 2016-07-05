//
//  ImageEnhance.m
//  TaoPiaoPiao
//
//  Created by blackcater on 16/7/5.
//  Copyright (c) 2016 blackcater. All rights reserved.
//

#import "ImageEnhance.h"

@implementation ImageEnhance

+ (void)createBlurBackground:(UIImageView *)image {
    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];

    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];

    visualEffectView.frame = image.bounds;

    [image addSubview:visualEffectView];
}

/*//创建高斯模糊效果的背景
func createBlurBackground (image:UIImage,view:UIView,blurRadius:Float) {
    //处理原始NSData数据
    let originImage = CIImage(CGImage: image.CGImage )
    //创建高斯模糊滤镜
    let filter = CIFilter(name: "CIGaussianBlur")
    filter.setValue(originImage, forKey: kCIInputImageKey)
    filter.setValue(NSNumber(float: blurRadius), forKey: "inputRadius")
    //生成模糊图片
    let context = CIContext(options: nil)
    let result:CIImage = filter.valueForKey(kCIOutputImageKey) as! CIImage
    let blurImage = UIImage(CGImage: context.createCGImage(result, fromRect: result.extent()))
    //将模糊图片加入背景
    let w = self.view.frame.width
    let h = self.view.frame.height
    let blurImageView = UIImageView(frame: CGRectMake(-w/2, -h/2, 2*w, 2*h)) //模糊背景是界面的4倍大小
    blurImageView.contentMode = UIViewContentMode.ScaleAspectFill //使图片充满ImageView
    blurImageView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight //保持原图长宽比
    blurImageView.image = blurImage
    self.view.insertSubview(blurImageView, belowSubview: view) //保证模糊背景在原图片View的下层
}*/

@end
