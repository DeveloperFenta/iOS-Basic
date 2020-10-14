//
//  ResultViewController.swift
//  SubmitValue-Segue
//
//  Created by Fenta on 2020/10/14.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultEmail: UILabel!
    
    @IBOutlet var resultUpdate: UILabel!
    
    @IBOutlet var resultInterval: UILabel!
    
    @IBOutlet var resultSettingDate: UILabel!
    
    var paramEmail = ""
    
    var paramUpdate = false
    
    var paramInterval = 0.0
    
    var paramSettingDate = Date()
    
    override func viewDidLoad() {
        resultEmail.text = paramEmail
        resultUpdate.text = paramUpdate ? "자동갱신 함" : "자동갱신 안함"
        resultInterval.text = "\(Int(paramInterval)) 분 마다"
        resultSettingDate.text = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .none
            dateFormatter.locale = Locale(identifier: "ko_KR")
            
            return dateFormatter.string(from: paramSettingDate)
        } ()
    }
    
}
