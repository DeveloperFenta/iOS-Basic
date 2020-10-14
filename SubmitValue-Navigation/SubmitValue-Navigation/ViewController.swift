//
//  ViewController.swift
//  SubmitValue-Navigation
//
//  Created by Fenta on 2020/10/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var email: UITextField!
    
    @IBOutlet var isUpdate: UISwitch!
    
    @IBOutlet var isUpdateLabel: UILabel!
    
    @IBOutlet var interval: UIStepper!
    
    @IBOutlet var intervalLabel: UILabel!
    
    @IBOutlet var settingDate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onSwitch(_ sender: UISwitch) {
        if sender.isOn {
            self.isUpdateLabel.text = "자동갱신 함"
        } else {
            self.isUpdateLabel.text = "자동갱신 안함"
        }
        
    }
    
    @IBAction func onStepper(_ sender: UIStepper) {
        self.intervalLabel.text = "\(Int(sender.value)) 분 마다"
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        guard let rvc = self.storyboard?.instantiateViewController(identifier: "RVC") as? ResultViewController else {
            return
        }
        
        if let email = self.email.text {
            rvc.paramEamil = email
        } else {
            rvc.paramEamil = "이메일이 입력되지 않았습니다"
        }
        rvc.paramUpdate = self.isUpdate.isOn
        rvc.paramInterval = self.interval.value
        rvc.paramSettingDate = self.settingDate.date
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
}

