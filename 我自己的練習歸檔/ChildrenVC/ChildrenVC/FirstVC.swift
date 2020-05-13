//
//  FirstVC.swift
//  ChildrenVC
//
//  Created by 邱志鴻 on 2019/1/4.
//  Copyright © 2019 邱志鴻. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        print(#file)
        print(#function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(#file)
        print(#function)
    }
    
}
