//
//  ViewController.swift
//  SceneTrans-NavigationController
//
//  Created by Fenta on 2020/10/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func movePresent(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(identifier: "SecondVC") else {
            return
        }
        
        uvc.modalTransitionStyle = .coverVertical
        
        present(uvc, animated: true)
    }
    
    @IBAction func moveByNavi(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(identifier: "SecondVC") else {
            return
        }
        
        self.navigationController?.pushViewController(uvc, animated: true)
    }
    
}

