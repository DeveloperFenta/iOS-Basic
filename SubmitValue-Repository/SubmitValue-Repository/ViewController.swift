//
//  ViewController.swift
//  SubmitValue-Repository
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
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        if let email = appDelegate?.email {
            self.email.text = email
        }
        
        if let isUpdate = appDelegate?.isUpdate {
            if isUpdate {
                self.isUpdate.isOn = true
                isUpdateLabel.text = "자동갱신 함"
            } else {
                self.isUpdate.isOn = false
                isUpdateLabel.text = "자동갱신 안함"
            }
        }
        
        if let interval = appDelegate?.interval {
            self.interval.value = interval
            self.intervalLabel.text = "\(Int(interval)) 분 마다"
        }
        
        if let settingDate = appDelegate?.settingDate {
            self.settingDate.setDate(settingDate, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "ManualSubmit":
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            
            if let email = self.email.text, email.count != 0 {
                appDelegate?.email = email
            }
            appDelegate?.isUpdate = isUpdate.isOn
            appDelegate?.interval = interval.value
            appDelegate?.settingDate = settingDate.date
        default:
            break
        }
    }

    @IBAction func onSwitch(_ sender: UISwitch) {
        if sender.isOn {
            isUpdateLabel.text = "자동갱신 함"
        } else {
            isUpdateLabel.text = "자동갱신 안함"
        }
    }
    
    @IBAction func onStepper(_ sender: UIStepper) {
        self.intervalLabel.text = "\(Int(sender.value)) 분 마다"
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        performSegue(withIdentifier: "ManualSubmit", sender: self)
    }
}

