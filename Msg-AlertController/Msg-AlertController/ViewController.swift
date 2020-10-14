//
//  ViewController.swift
//  Msg-AlertController
//
//  Created by Fenta on 2020/10/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var result: UILabel!
    
    @IBOutlet var id: UILabel!
    
    @IBOutlet var pw: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let alert = UIAlertController(title: "AlertController",
                                      message: "AlertController 실습",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인",
                                     style: .default)
        
        alert.addAction(okAction)
        
        present(alert, animated: false)
    }

    @IBAction func simpleAlert(_ sender: Any) {
        let alert = UIAlertController(title: "선택",
                                      message: "항목을 선택하세요",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인",
                                     style: .default) { _ in
            self.result.text = "확인 버튼 클릭"
        }
        
        let execAction = UIAlertAction(title: "실행",
                                       style: .default) { _ in
            self.result.text = "실행 버튼 클릭"
        }
        
        let stopAction = UIAlertAction(title: "중지",
                                       style: .destructive) { _ in
            self.result.text = "중지 버튼 클릭"
        }
        
        let cancelAction = UIAlertAction(title: "취소",
                                         style: .cancel) { _ in
            self.result.text = "취소 버튼 클릭"
        }
        
        alert.addAction(okAction)
        alert.addAction(execAction)
        alert.addAction(stopAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: false)
    }
    
    @IBAction func textFieldAlert(_ sender: Any) {
        let alert = UIAlertController(title: "텍스트 필드",
                                      message: "정보를 입력하세요",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인",
                                     style: .default) { _ in
            if let textField = alert.textFields?[0] {
                self.id.text = textField.text!
            }
            
            if let textField = alert.textFields?[1] {
                self.pw.text = textField.text!
            }
        }
        
        let cancelAction = UIAlertAction(title: "취소",
                                         style: .cancel)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        alert.addTextField {
            $0.placeholder = "아이디"
            $0.isSecureTextEntry = false
        }
        alert.addTextField {
            $0.placeholder = "암호"
            $0.isSecureTextEntry = true
        }
        
        present(alert, animated: false)
    }
    

}

