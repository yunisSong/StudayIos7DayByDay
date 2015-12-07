#ios 编程实战(iOS 7 Programming Pushing the Limits)读书笔记20151007
##用半透明实现层次和上下文

###1，截取屏幕代码
```    
float scale = [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, YES, scale);
    [self.view drawViewHierarchyInRect:self.view.frame afterScreenUpdates:NO];
    __block UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
```

###2，可以通过Category为现有的类添加方法

之前只是知道这个概念，但是很少使用，现在发现Category很方便的扩展了类方法，且降低了耦合，代码的复用率也极高。
