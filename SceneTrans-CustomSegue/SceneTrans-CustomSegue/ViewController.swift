//
//  ViewController.swift
//  SceneTrans-CustomSegue
//
//  Created by Fenta on 2020/10/13.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueIdentifier = segue.identifier {
            switch segueIdentifier {
            case "custom_segue":
                NSLog("커스텀 세그웨이가 곧 실행됩니다")
            case "action_segue":
                NSLog("액션 세그웨이가 곧 실행됩니다")
            default:
                NSLog("알 수 없는 세그웨이가 곧 실행됩니다")
            }
        }
    }
    
    @IBAction func unwindToVC(_ segue: UIStoryboardSegue) {
        
    }

}

