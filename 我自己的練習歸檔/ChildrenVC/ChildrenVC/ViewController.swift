//
//  ViewController.swift
//  ChildrenVC
//
//  Created by 邱志鴻 on 2019/1/4.
//  Copyright © 2019 邱志鴻. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let firstVC = FirstVC()
    let secondVC = SecondVC()

    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.containerView.addSubview(self.firstVC.view)
        self.containerView.addSubview(self.secondVC.view)
    }
    
    override func viewDidLayoutSubviews() {
        self.firstVC.view.frame = self.containerView.bounds
        self.secondVC.view.frame = self.containerView.bounds
    }

    @IBAction func onSegmentedControlAction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.firstVC.beginAppearanceTransition(true, animated: true)
            self.containerView.bringSubviewToFront(self.firstVC.view)
            self.firstVC.view.frame.origin.x = self.containerView.frame.width
            UIView.animate(withDuration: 0.3) {
                self.firstVC.view.frame.origin.x = 0
            }
//            self.firstVC.view.alpha = 0.0
//            UIView.animate(withDuration: 0.3) {
//                self.firstVC.view.alpha = 1.0
//            }
            self.firstVC.endAppearanceTransition()
            self.firstVC.didMove(toParent: self)
        case 1:
            self.secondVC.beginAppearanceTransition(true, animated: true)
            self.containerView.bringSubviewToFront(self.secondVC.view)
            self.secondVC.view.frame.origin.x = -self.containerView.frame.width
            UIView.animate(withDuration: 0.3) {
                self.secondVC.view.frame.origin.x = 0
            }
//            self.secondVC.view.alpha = 0.0
//            UIView.animate(withDuration: 0.3) {
//                self.secondVC.view.alpha = 1.0
//            }
            self.secondVC.endAppearanceTransition()
            self.secondVC.didMove(toParent: self)
        default:
            break
        }
    }
    
}

