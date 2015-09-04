//
//  ViewController.swift
//  PanTest
//
//  Created by Masaki Horimoto on 2015/08/29.
//  Copyright (c) 2015年 Masaki Horimoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    var inButton = false
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.label.text = "\(count)"
        let myTap = UIPanGestureRecognizer(target: self, action: "didPan:")
        self.button.addGestureRecognizer(myTap)
    }
    
    @IBAction func pressButton(sender: AnyObject) {
        count++
        self.label.text = "\(count)"
    }
    
    func didPan(sender: AnyObject) {
        println("a")

        if let pan = sender as? UIPanGestureRecognizer {

            let p = pan.locationInView(self.view)
            if !inButton &&  self.button.frame.contains(p)
            {
                count++
                inButton = !inButton
                self.label.text = "\(count)"
            }else if inButton && !self.button.frame.contains(p) {
                inButton = !inButton
            }
        }
    }

}

