//
//  ResultViewController.swift
//  SubmitValue-Repository
//
//  Created by Fenta on 2020/10/14.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var email: UILabel!
    
    @IBOutlet var isUpdate: UILabel!
    
    @IBOutlet var interval: UILabel!
    
    @IBOutlet var settingDate: UILabel!
    
    override func viewDidLoad() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        if let email = appDelegate?.email {
            self.email.text = email
        } else {
            email.text = "이메일이 설정되지 않았습니다"
        }
        
        if let isUpdate = appDelegate?.isUpdate {
            self.isUpdate.text = isUpdate ? "자동갱신 함" : "자동갱신 안함"
        } else {
            isUpdate.text = "갱신여부 미설정"
        }
        
        if let interval = appDelegate?.interval {
            self.interval.text = "\(Int(interval)) 분 마다"
        } else {
            interval.text = "갱신주기 미설정"
        }
        
        if let settingDate = appDelegate?.settingDate {
            self.settingDate.text = {
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .long
                dateFormatter.timeStyle = .none
                dateFormatter.locale = Locale(identifier: "ko_KR")
                
                return dateFormatter.string(from: settingDate)
            } ()
        } else {
            settingDate.text = "설정 정보 없음"
        }
    }
    
}
