//
//  ViewController.swift
//  Delegate-TextField
//
//  Created by Fenta on 2020/10/15.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textField.placeholder = "값을 입력하세요" // 안내 메세지 설정
        textField.keyboardType = .alphabet // 키보드 타입 설정
        textField.keyboardAppearance = .dark // 키보드 다크 모드 설정
        textField.returnKeyType = .join // 리턴키 타입 설정
        textField.enablesReturnKeyAutomatically = true // 리턴키 자동 활성화 설정
        
        textField.borderStyle = .line // 테두리 스타일 설정
        textField.backgroundColor = UIColor(white: 0.87, alpha: 1.0) // 배경 색상 설정
        textField.contentVerticalAlignment = .center // 수직 방향 정렬 설정
        textField.contentHorizontalAlignment = .center // 수평 방향 정렬 설정
        textField.layer.borderColor = UIColor.darkGray.cgColor // 테두리 색상 설정
        textField.layer.borderWidth = 2.0 // 테두리 두께 설정
        
        textField.becomeFirstResponder()
        textField.delegate = self
    }

    @IBAction func becomeFR(_ sender: Any) {
        textField.becomeFirstResponder()
    }
    
    @IBAction func resignFR(_ sender: Any) {
        textField.resignFirstResponder()
    }
    
    // 텍스트 필드 편집을 시작할 때 호출됨
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("텍스트 편집을 시작합니다.")
        return true // false 를 반환하면 편집 불가능
    }
    
    // 텍스트 필드 내용이 삭제될 때 호출됨
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 내용이 삭제됩니다.")
        return true // false 를 반환하면 삭제 불가능
    }
    
    // 텍스트 필드 내용이 변경될 때 호출됨
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("텍스트 필드의 내용이 변경됩니다.")
        print("-------- 변경사항 --------")
        print(string)
        print("------------------------")
        print("")
        
        // 숫자 입력 제한
        if Int(string) == nil {
            
            // 입력 길이 제한
            if (textField.text?.count)! + string.count > 10 {
                return false // false 를 반환하면 변경 불가능
            } else {
                return true
            }
            
        } else {
            return false
        }
    }
    
    // 텍스트 필드의 Return 키가 눌렸을 때 호출됨
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 Return 키가 눌렸습니다.")
        return true
    }
    
    // 텍스트 필드의 편집이 종료될 때 호출됨
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("텍스트 필드의 편집이 곧 종료됩니다.")
        return true // false 를 반환하면 편집 종료 불가능
    }
    
    // 텍스트 필드의 편집이 종료되었을 때 호출됨
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("텍스트 필드의 편집이 종료되었습니다.")
    }
}

