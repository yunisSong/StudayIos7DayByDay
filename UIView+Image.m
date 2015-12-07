//
//  UIView+Image.m
//  StudyIos7DayByDay
//
//  Created by Yunis on 15/12/7.
//  Copyright © 2015年 Yunis. All rights reserved.
//

#import "UIView+Image.h"

@implementation UIView (Image)
- (UIImage *)snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}
@end
