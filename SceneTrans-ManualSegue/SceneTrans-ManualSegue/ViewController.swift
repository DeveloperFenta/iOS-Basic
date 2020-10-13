//
//  ViewController.swift
//  SceneTrans-ManualSegue
//
//  Created by Fenta on 2020/10/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func wind(_ sender: Any) {
        self.performSegue(withIdentifier: "ManualWind", sender: self)
    }
    
    @IBAction func unwindToVC(_ segue: UIStoryboardSegue) {
        
    }
}

