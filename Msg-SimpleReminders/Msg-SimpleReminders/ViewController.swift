//
//  ViewController.swift
//  Msg-SimpleReminders
//
//  Created by Fenta on 2020/10/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var msg: UITextField!
    
    @IBOutlet var alertDate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submit(_ sender: Any) {
        UNUserNotificationCenter.current().getNotificationSettings {
            if $0.authorizationStatus == .authorized {
                DispatchQueue.main.async {
                    let notiContent = UNMutableNotificationContent()
                    notiContent.title = "미리 알림"
                    if let msg = self.msg.text, msg.count != 0 {
                        notiContent.body = msg
                    } else {
                        notiContent.body = "알림 내용 없음"
                    }
                    notiContent.badge = 1
                    notiContent.sound = .default
                    
                    let notiTrigger = UNTimeIntervalNotificationTrigger(timeInterval: self.alertDate.date.timeIntervalSinceNow, repeats: false)
                    
                    let notiRequest = UNNotificationRequest(identifier: "noti",
                                                            content: notiContent,
                                                            trigger: notiTrigger)
                    
                    UNUserNotificationCenter.current().add(notiRequest) { _ in
                        DispatchQueue.main.async {
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateStyle = .long
                            dateFormatter.timeStyle = .short
                            dateFormatter.locale = Locale(identifier: "ko_KR")
                            
                            let completionMsg = "알림이 등록되었습니다.\n\(dateFormatter.string(from:self.alertDate.date))에 알림이 발송됩니다."
                            
                            let alert = UIAlertController(title: "알림 등록 완료",
                                                          message: completionMsg,
                                                          preferredStyle: .alert)
                            
                            let okAction = UIAlertAction(title: "확인", style: .default)
                            
                            alert.addAction(okAction)
                            
                            self.present(alert, animated: false)
                        }
                    }
                }
            } else {
                let alert = UIAlertController(title: "알림 등록",
                                              message: "알림 권한을 허용하지 않아 서비스를 이용할 수 없습니다.",
                                              preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "확인",
                                             style: .default)
                
                alert.addAction(okAction)
                
                self.present(alert, animated: true)
                
                return
            }
        }
    }
    
}

