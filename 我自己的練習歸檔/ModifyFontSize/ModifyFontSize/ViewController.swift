//
//  ViewController.swift
//  ModifyFontSize
//
//  Created by 邱志鴻 on 2019/1/4.
//  Copyright © 2019 邱志鴻. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var flag = false {
        willSet {
            if newValue {
                UIView.animate(withDuration: 0.3) {
                    self.label.transform = CGAffineTransform(scaleX: 2.3, y: 2.3)
                }
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.label.transform = CGAffineTransform.identity   
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.flag.toggle()
    }
}

