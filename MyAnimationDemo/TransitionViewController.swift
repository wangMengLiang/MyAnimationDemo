//
//  TransitionViewController.swift
//  MyAnimationDemo
//
//  Created by Miller on 17/2/21.
//  Copyright © 2017年 Miller. All rights reserved.
//

import UIKit

class TransitionViewController: UIViewController {
    var titleArr = ["第一个","第二个","第三个","第四个"]
    var btnArr:[UIButton] = []
    var containerView:UIView = UIView(frame: CGRect(x: 0, y: 64+49, width: WIDTH, height: HEIGHT-64-49))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        self.view.addSubview(containerView)
        self.loadControllers()
        
        containerView.bringSubview(toFront: vcArr[0].view)
    }
    var vcArr:[UIViewController] = []
    func loadControllers(){
        let titleView = UIView(frame: CGRect(x: 0, y: 64, width: WIDTH, height: 49))
        self.view.addSubview(titleView)
        titleView.backgroundColor = UIColor.lightGray

        let bWidth = WIDTH/CGFloat(titleArr.count)
        for i in 0..<titleArr.count {
            let titleBtn = UIButton(frame: CGRect(x: CGFloat(i)*bWidth, y: 0, width: bWidth, height: 49))
            titleBtn.setTitle(titleArr[i], for: UIControlState())
            titleBtn.setTitleColor(UIColor.black, for: UIControlState())
            if i == 0 {
                titleBtn.setTitleColor(UIColor.blue, for: UIControlState())
            }

//            titleBtn.addTarget(self, action: #selector(titleBtnClick(_:)), for: .touchUpInside)
            titleBtn.tag = i
            titleView.addSubview(titleBtn)
            
            btnArr.append(titleBtn)
  
            let baseVC = UIViewController()
            print("\(arc4random()%255)")
            baseVC.view.backgroundColor = UIColor(red: CGFloat(arc4random()%255)/255.0, green: CGFloat(arc4random()%255)/255.0, blue: CGFloat(arc4random()%255)/255.0, alpha: 1.0)
            baseVC.view.frame = CGRect(x: 0, y: 0, width: WIDTH, height: HEIGHT-64-49)
            
            baseVC.view.tag = i
            
            vcArr.append(baseVC)
            self.addChildViewController(baseVC)
            self.containerView.addSubview(baseVC.view)
            
            let leftSwipe =  UISwipeGestureRecognizer(target: self, action: #selector(TransitionViewController.swipeAction(_:)))
            leftSwipe.direction = .left
            baseVC.view.addGestureRecognizer(leftSwipe)
            
            let rightSwipe =  UISwipeGestureRecognizer(target: self, action: #selector(TransitionViewController.swipeAction(_:)))
            rightSwipe.direction = .right
            baseVC.view.addGestureRecognizer(rightSwipe)

        }
    
    }
    
    var currentIndex:Int = 0
    func swipeAction(_ swipe:UISwipeGestureRecognizer){

        let animation = CATransition()
        animation.type = "oglFlip"
        animation.duration = 1
        
        if swipe.direction == .left {
            currentIndex = swipe.view!.tag+1
            if swipe.view!.tag == vcArr.count-1 {
                currentIndex = 0
            }
            
            animation.subtype = kCATransitionFromRight
        }else if swipe.direction == .right {
            currentIndex = swipe.view!.tag-1
            if swipe.view!.tag == 0 {
                currentIndex = vcArr.count-1
            }
            animation.subtype = kCATransitionFromLeft
        }
        containerView.bringSubview(toFront: vcArr[currentIndex].view)
        self.containerView.layer.add(animation, forKey: nil)
        
        for btn in btnArr{
            btn.setTitleColor(UIColor.black, for: .normal)
        }
        btnArr[currentIndex].setTitleColor(UIColor.blue, for: .normal)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
