//
//  SecondViewController.swift
//  SceneTrans-NavigationController
//
//  Created by Fenta on 2020/10/13.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBAction func back(_ sender: Any) {
        if let presentingVC = self.presentingViewController {
            presentingVC.dismiss(animated: true)
        } else {
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
}
