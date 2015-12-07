//
//  UIImage+YunisBlur.h
//  StudyIos7DayByDay
//
//  Created by Yunis on 15/12/7.
//  Copyright © 2015年 Yunis. All rights reserved.
//

@import UIKit;

@interface UIImage (YunisBlur)
- (UIImage *)applyLightEffect;
- (UIImage *)applyExtraLightEffect;
- (UIImage *)applyDarkEffect;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;

- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;
@end
