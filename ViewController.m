//
//  ViewController.m
//  StudyIos7DayByDay
//
//  Created by Yunis on 15/12/7.
//  Copyright © 2015年 Yunis. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Image.h"
#import "UIImage+YunisBlur.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *addlayerBtr;
@property (weak, nonatomic) IBOutlet UIButton *reovelayerBtr;


@property (strong, nonatomic) CALayer *layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addLayer{
    //创建图层

       [self.view.layer addSublayer:self.layer];
    
    //截图
    float scale = [UIScreen mainScreen].scale;
//    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, YES, scale);
//    [self.view drawViewHierarchyInRect:self.view.frame afterScreenUpdates:NO];
//    __block UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
    
    UIImage *image = [self.view snapshotImage];
    
    //裁剪截图
    CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage,
                                                       CGRectMake(self.layer.frame.origin.x * scale,
                                                                  self.layer.frame.origin.y * scale,
                                                                  self.layer.frame.size.width * scale,
                                                                  self.layer.frame.size.height * scale));
    image = [UIImage imageWithCGImage:imageRef];
    //添加模糊效果模糊
    image = [image applyBlurWithRadius:10.0f
                             tintColor:[UIColor colorWithRed:0 green:1 blue:0 alpha:0.1]
                 saturationDeltaFactor:1.0f
                             maskImage:nil];
    
    //把模糊效果展示在图层上
    self.layer.contents = (__bridge id)(image.CGImage);

}

- (IBAction)removeLayer
{
    //移除layer
    [self.view.layer.sublayers enumerateObjectsUsingBlock:^(CALayer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj == self.layer) {
            NSLog(@"ggggggggg");
            [obj removeFromSuperlayer];
        }
   
    }];
    self.layer.contents = nil;
}

- (CALayer *)layer{
    if (_layer == nil) {
        _layer = [[CALayer alloc] init];
        _layer.frame = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height - 100);

    }
    
    return _layer;
}
@end
