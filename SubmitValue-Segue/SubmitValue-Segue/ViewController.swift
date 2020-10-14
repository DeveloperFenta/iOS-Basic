//
//  ViewController.swift
//  SubmitValue-Segue
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let rvc = segue.destination as? ResultViewController else {
            return
        }
        
        if let email = self.email.text, email.count != 0 {
            rvc.paramEmail = email
        } else {
            rvc.paramEmail = "이메일이 설정되지 않았습니다"
        }
        rvc.paramUpdate = isUpdate.isOn
        rvc.paramInterval = interval.value
        rvc.paramSettingDate = settingDate.date
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
        performSegue(withIdentifier: "ManualSubmit", sender: self)
    }
    
    @IBAction func unwindToSetting(_ segue: UIStoryboardSegue) {
        
    }
    
}

