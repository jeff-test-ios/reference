//
//  SecondVC.swift
//  ChildrenVC
//
//  Created by 邱志鴻 on 2019/1/4.
//  Copyright © 2019 邱志鴻. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        print(#file)
        print(#function)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(#file)
        print(#function)
    }

}
