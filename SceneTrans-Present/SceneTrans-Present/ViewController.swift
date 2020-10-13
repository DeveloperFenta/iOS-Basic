//
//  ViewController.swift
//  SceneTrans-Present
//
//  Created by Fenta on 2020/10/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveNext(_ sender: Any) {
//        if you want to load another storyboard file        
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//        let uvc = storyboard.instantiateViewController(identifier: "SecondVC")
        
        guard let uvc = self.storyboard?.instantiateViewController(identifier: "SecondVC") else {
            return
        }
        
        uvc.modalTransitionStyle = .coverVertical
        
        present(uvc, animated: true)
    }
    
}

