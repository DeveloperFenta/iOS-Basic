//
//  ViewController.swift
//  SubmitValue-Present
//
//  Created by Fenta on 2020/10/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var email: UITextField!
    
    @IBOutlet var isUpdate: UISwitch!
    
    @IBOutlet var interval: UIStepper!
    
    @IBOutlet var isUpdateText: UILabel!
    
    @IBOutlet var intervalText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onSwitch(_ sender: UISwitch) {
        if sender.isOn {
            self.isUpdateText.text = "자동갱신"
        } else {
            self.isUpdateText.text = "갱신안함"
        }
    }
    
    @IBAction func onStepper(_ sender: UIStepper) {
        self.intervalText.text = "\(Int(sender.value)) 분 마다"
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        guard let rvc = self.storyboard?.instantiateViewController(identifier: "RVC") as? ResultViewController else {
            return
        }
        
        if let email = self.email.text {
            rvc.paramEmail = email
        } else {
            rvc.paramEmail = "이메일이 입력되지 않았습니다"
        }
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
        
        rvc.modalTransitionStyle = .coverVertical
        
        present(rvc, animated: true)
    }
}

