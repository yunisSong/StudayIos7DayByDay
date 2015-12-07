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


###3，变量、方法命名
虽然变量名你可以命名成任何名称，但是变量名一定要体现出变量的类型和作用，这样有助于阅读代码。
譬如，一个存储时间字符串的数组，你可以命名dates，但是如果别人从你的的数组中取得一个元素，根本不知道什么类型，而如果你命名成dateStrings就很明了了告诉使用者里面储存的是string类型的date数据。
同理，一个方法的命名要体现出这个方法的作用，如果带有参数，要体现出参数的类型和参数的意义。


###4，使用分类的坏处
从技术上讲，分类可以覆盖原有方法，会导致令人发疯的bug，而且相当难调试出来。为了避免覆盖原类方法，推荐给分类方法加上前缀.

###5，+load方法
分类是在运行时附着在类上的，所以分类可能会在很晚的时间才被添加进来。但是oc提供了一个方法+（void）load;当分类第一次运行时就会调用。
<font color=#0099ff>每个load方法都会被调用一次，而且不应该调用【super load】方法。</font>


###6，关联引用
关联引用允许开发者为类添加键值数据。这样就可以为分类中添加属性了。
关联是基于键的内存地址，而不是值的，所以一般会用为赋值的static char 变量作为键的原因。
关联可以像属性那样添加copy，assign等语义。
<font color=#0099ff>意味着可以用关联来监控对象什么时间销毁。可以作为调试的技术手段或者执行清理工作等。</font>