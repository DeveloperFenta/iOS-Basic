//
//  ResultViewController.swift
//  SubmitValue-Navigation
//
//  Created by Fenta on 2020/10/14.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultEmail: UILabel!
    
    @IBOutlet var resultUpdate: UILabel!
    
    @IBOutlet var resultInterval: UILabel!
    
    @IBOutlet var resultSettingDate: UILabel!
    
    lazy var paramEamil = ""
    
    lazy var paramUpdate = false
    
    lazy var paramInterval = 0.0
    
    lazy var paramSettingDate = Date()
    
    override func viewDidLoad() {
        self.resultEmail.text = paramEamil
        self.resultUpdate.text = paramUpdate ? "자동갱신 함" : "자동갱신 안함"
        self.resultInterval.text = "\(Int(paramInterval)) 분 마다"
        self.resultSettingDate.text = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .none
            dateFormatter.locale = Locale(identifier: "ko_KR")
            
            return dateFormatter.string(from: paramSettingDate)
        } ()
        
    }
    
}
