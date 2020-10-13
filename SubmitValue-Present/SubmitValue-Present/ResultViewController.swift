//
//  ResultViewController.swift
//  SubmitValue-Present
//
//  Created by Fenta on 2020/10/13.
//

import UIKit

class ResultViewController: UIViewController {
    
    var paramEmail = ""
    
    var paramUpdate = false
    
    var paramInterval = 0.0
    
    @IBOutlet var resultEmail: UILabel!
    
    @IBOutlet var resultUpdate: UILabel!
    
    @IBOutlet var resultInterval: UILabel!
    
    override func viewDidLoad() {
        self.resultEmail.text = paramEmail
        self.resultUpdate.text = paramUpdate ? "자동갱신 함" : "자동갱신 안함"
        self.resultInterval.text = "\(Int(paramInterval)) 분 마다 갱신"
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true)
    }
}
