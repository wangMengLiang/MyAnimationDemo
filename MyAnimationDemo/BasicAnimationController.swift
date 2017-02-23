//
//  BasicAnimationController.swift
//  MyAnimationDemo
//
//  Created by Miller on 17/2/20.
//  Copyright © 2017年 Miller. All rights reserved.
//

import UIKit

class BasicAnimationController: UIViewController {
    
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = #imageLiteral(resourceName: "wechat")
        view.addSubview(imageView)
        imageView.center = view.center
        view.backgroundColor = UIColor.lightGray
        
        let pauseBtn = UIButton(frame: CGRect(x: 50, y: HEIGHT-100, width: 100, height: 50))
        pauseBtn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
        pauseBtn.setTitle("暂停", for: .normal)
        pauseBtn.tag = 11
        pauseBtn.setTitleColor(UIColor.black, for: .normal)
        let startBtn = UIButton(frame: CGRect(x: 200, y: HEIGHT-100, width: 100, height: 50))
        startBtn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
        startBtn.setTitle("开始", for: .normal)
        startBtn.setTitleColor(UIColor.black, for: .normal)
        
        self.view.addSubview(pauseBtn)
        self.view.addSubview(startBtn)
    }
    
    func btnClick(_ btn:UIButton){
        if btn.tag == 11 {
            self.pauseKeyframeAnimation(imageView.layer)
        }else{
            self.resumeLayer(imageView.layer)
        }
    
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.groupAnimation2()
    }
    
    //平移动画
    func animation1(){
        //初始化并设置动画类型
        let animation = CABasicAnimation(keyPath: "transform.translation")
        animation.duration = 1
        //这里的点是指偏移量
//        animation.byValue = NSValue(cgPoint: CGPoint(x: 0, y: 200))
        animation.byValue = CGPoint(x: 0, y: 200)
        //保持动画执行后的状态
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        //向执行动画的图层添加动画
        imageView.layer.add(animation, forKey: nil)
    }
    //旋转动画
    func animation2(){
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.duration = 2
        //无限重复
        animation.repeatCount = HUGE
        //360度 M_PI*2
        animation.byValue = M_PI*2
        //设置动画节奏
        //kCAMediaTimingFunctionEaseIn,先慢后快
        //kCAMediaTimingFunctionEaseOut,先快后慢
        //kCAMediaTimingFunctionLinear,语速执行
        //kCAMediaTimingFunctionEaseInEaseOut,中间快两边慢
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        imageView.layer.add(animation, forKey: nil)
    }
    
    //缩放动画
    func animation3(){
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.duration = 0.5
        //在原来图片基础上再放大0.2倍负数表示缩小
        animation.byValue = 0.4
        //动画结束时是否执行逆动画
        animation.autoreverses = true
        //无限重复
        animation.repeatCount = HUGE
        imageView.layer.add(animation, forKey: nil)
    
    }
    
    //大小动画
    func animation4(){
        let animation = CABasicAnimation(keyPath: "bounds")
        animation.duration = 1
        //缩放到指定的大小，要用CGRECT
        animation.toValue = CGRect(x:0, y:0, width:50, height:50)
        //保持动画执行后的状态
//        animation.isRemovedOnCompletion = false
//        animation.fillMode = kCAFillModeForwards
    
        //动画结束时是否执行逆动画
        animation.autoreverses = true
        //无限重复
        animation.repeatCount = HUGE
        
        imageView.layer.add(animation, forKey: nil)
    }
    
    //位置动画
    func animation5(){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 1
        //第一种：设置坐标点，移动到改位置(执行一次)
//        animation.toValue = CGPoint(x: 200, y: 200)
        //第二种：设置偏移量
        animation.byValue = CGPoint(x: 0, y: 200)
        //保持动画执行后的状态
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
        //用来设置动画延迟执行时间
        animation.beginTime = CACurrentMediaTime()+2
        imageView.layer.add(animation, forKey: nil)
    }
    //贞动画
    func animation6(){
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.duration = 4
        let path = CGMutablePath()
        //椭圆形路径（矩形区域）
//        path.addEllipse(in: CGRect(x: 50, y: 200, width: WIDTH-100, height: WIDTH-200))
//        path.addRoundedRect(in: CGRect(x: 50, y: 200, width: WIDTH-100, height: WIDTH-200), cornerWidth: 50, cornerHeight: 50)
        path.move(to: CGPoint(x: 0, y: 200))
        path.addLine(to: CGPoint(x: 100, y: 200))
        path.addLine(to: CGPoint(x: 200, y: 200))
        path.addLine(to: CGPoint(x: 200, y: 100))
        path.addLine(to: CGPoint(x: WIDTH, y: HEIGHT))
        animation.path = path
//        该 属性是一个数组，用以指定每个子路径(AB,BC,CD)的时间
        animation.keyTimes = [0.0,0.1,0.4,0.6,1.0]
        
        //保持动画执行后的状态,其中首尾必须分别是0和1
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
        imageView.layer.add(animation, forKey: nil)
    }
    
    //抖动动画
    func shakeAnimation(){
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation")
        animation.values = [-M_PI/180*4,M_PI/180*4,-M_PI/180*4]
        animation.repeatCount = HUGE
        imageView.layer.add(animation, forKey: nil)
        
    }
    
    //暂停动画
    func pauseKeyframeAnimation(_ layer:CALayer){
        let pauseTime = layer.convertTime(CACurrentMediaTime(), from: nil)
        layer.speed = 0.0
        layer.timeOffset = pauseTime
    
    }
    
    func resumeLayer(_ layer:CALayer){
        let pausedTime = layer.timeOffset
        layer.speed = 1.0
        layer.timeOffset = 0.0
        layer.beginTime = 0.0
        let timeSincePause = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        layer.beginTime = timeSincePause
    
    }
    
    
    //同时执行的组动画
    func groupAnimation(){
        let anima1 = CABasicAnimation(keyPath: "position")
        anima1.toValue = CGPoint(x: WIDTH-100, y: 100)

        let anima2 = CABasicAnimation(keyPath: "transform.scale")
        anima2.toValue = 0.0
        
        let anima3 = CABasicAnimation(keyPath: "transform.rotation")
        anima3.toValue = M_PI*8
        
        let groupAnimation = CAAnimationGroup()
        
        groupAnimation.animations = [anima1, anima2, anima3]
        groupAnimation.duration = 1.5
        groupAnimation.isRemovedOnCompletion = false
        groupAnimation.fillMode = kCAFillModeForwards
        imageView.layer.add(groupAnimation, forKey: nil)
    }
    //顺序执行的组动画
    func groupAnimation2(){
        let currentTime = CACurrentMediaTime()
        //平移动画
        let anima1 = CABasicAnimation(keyPath: "position")
        anima1.fromValue = CGPoint(x:0, y:HEIGHT/2-75)
        anima1.toValue = CGPoint(x: WIDTH/2, y: HEIGHT/2-75)
        anima1.beginTime = currentTime
        anima1.duration = 1
        anima1.fillMode = kCAFillModeForwards
        anima1.isRemovedOnCompletion = false
        
        imageView.layer.add(anima1, forKey: "aa")
        
        //缩放
        let anima2 = CABasicAnimation(keyPath: "transform.scale")
        anima2.fromValue = 0.8
        anima2.toValue = 2.0
        anima2.beginTime = currentTime+1
        anima2.duration = 1
        anima2.fillMode = kCAFillModeForwards
        anima2.isRemovedOnCompletion = false
        imageView.layer.add(anima2, forKey: "bb")
        
        //旋转
        let anima3 = CABasicAnimation(keyPath:"transform.rotation")
        anima3.toValue = M_PI*4
        anima3.beginTime = currentTime + 2
        anima3.duration = 1
        anima3.fillMode = kCAFillModeForwards
        anima3.isRemovedOnCompletion = false
        imageView.layer.add(anima3, forKey: "cc")
        

    }
    

}













