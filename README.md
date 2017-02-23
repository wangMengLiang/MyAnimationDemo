# MyAnimationDemo
![](https://camo.githubusercontent.com/bde5aa6ee0e1feec044d184a735da8024c60c04c/687474703a2f2f692e696d6775722e636f6d2f427771486842342e706e67)
![](https://camo.githubusercontent.com/e357193ca51e358b7471de58d4071c3a418d1c0e/68747470733a2f2f696d672e736869656c64732e696f2f636f636f61706f64732f64742f4368616d656c656f6e4672616d65776f726b2e7376673f6d61784167653d3836343030) ![](https://camo.githubusercontent.com/c513912483f083fbfb83d2c3a7d3de3fb4cb698d/68747470733a2f2f696d672e736869656c64732e696f2f636f636f61706f64732f61742f4368616d656c656f6e4672616d65776f726b2e7376673f6d61784167653d3836343030) ![](https://camo.githubusercontent.com/94c0991fef8c45ae43b5d8527b6ab331c0b7a379/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f706c6174666f726d2d694f53253230382532422d626c75652e7376673f7374796c653d666c6174)

[● 基本使用](https://github.com/wangMengLiang/MyAnimationDemo/blob/master/#MyAnimationDemo-基本使用)

####基础动画和Tab过渡动画
![](https://github.com/wangMengLiang/MyAnimationDemo/blob/master/Untitled.gif)

###效果图（可下载demo真机运行效果更好）
截图中，左上角的开关代表push和present，所有效果都支持手势，我就不一一演示了

1、CircleSpreadTransition 小圆点扩散

![](https://camo.githubusercontent.com/7d15320d0ca82fe4266f103e7eaad26da16556e5/687474703a2f2f75706c6f61642d696d616765732e6a69616e7368752e696f2f75706c6f61645f696d616765732f313135343035352d313563626662376165666532656663632e6769663f696d6167654d6f6772322f6175746f2d6f7269656e742f7374726970)

2、MagicMoveTransition 神奇移动

![](https://camo.githubusercontent.com/ea9f6c21cbfa127565d87696ea54a107913703e3/687474703a2f2f75706c6f61642d696d616765732e6a69616e7368752e696f2f75706c6f61645f696d616765732f313135343035352d376632613766396666343539303631312e6769663f696d6167654d6f6772322f6175746f2d6f7269656e742f7374726970)

##基本使用
1、clone后将XWTranstion文件夹导入工程
2、导入`UINavigationController+XWTransition.h`或者`UIViewController+XWTransition.h`两个分类
3、选择你需要的效果器进行根据初始化方法进行初始化，比如下面的小圆点扩散，初始化指定开始圆心和半径
`XWCircleSpreadAnimator *animator = [XWCircleSpreadAnimator xw_animatorWithStartCenter:self.button.center radius:20];`
4、通过初始化的效果器转场，根据分类提供两个方法进行push或者present，就完成了！
``` swift
/**
 *  通过指定的转场animator来push控制器，达到不同的转场效果
 *
 *  @param viewController 被push的控制器
 *  @param animator       转场Animator
 */
- (void)xw_pushViewController:(UIViewController *)viewController withAnimator:(XWTransitionAnimator *)animator;

/**
 *  通过指定的转场animator来present控制器
 *
 *  @param viewController 被modal出的控制器
 *  @param animator       转场animator
 */
- (void)xw_presentViewController:(UIViewController *)viewController withAnimator:(XWTransitionAnimator *)animator;

//事例代码如下
[self.navigationController xw_pushViewController:toVC withAnimator:animator];
或者
[self xw_presentViewController:toVC withAnimator:animator];

```




