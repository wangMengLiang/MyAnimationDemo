//
//  ViewController.swift
//  MyAnimationDemo
//
//  Created by Miller on 17/2/20.
//  Copyright © 2017年 Miller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let btnArr = ["基础动画","过渡动画"]
        self.view.backgroundColor = UIColor.white
        for i in 0..<btnArr.count {
            let btn = UIButton(frame: CGRect(x: (WIDTH-200)/2, y: 100+CGFloat(i)*100, width: 200, height: 50))
            btn.backgroundColor = UIColor.green
            btn.setTitle(btnArr[i], for: .normal)
            btn.setTitleColor(UIColor.white, for: .normal)
            self.view.addSubview(btn)
            btn.tag = i
            btn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
        }
        
    }
    
    func btnClick(_ btn:UIButton){
        if btn.tag == 0 {//基础动画
            let vc = BasicAnimationController()
            self.navigationController?.pushViewController(vc, animated: true)
        }else if btn.tag == 1{
            let vc = TransitionViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

