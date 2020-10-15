//
//  ViewController.swift
//  Delegate-ImagePicker
//
//  Created by Fenta on 2020/10/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func selectImg(_ sender: Any) {
        let alert = UIAlertController(title: nil,
                                      message: nil,
                                      preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "사진 찍기",
                                         style: .default) { (_) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                self.getImg(sourceType: .camera)
            } else {
                let alert = UIAlertController(title: "카메라를 실행할 수 없습니다",
                                              message: "왜냐면 시뮬레이터엔 카메라가 없거든",
                                              preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "확인",
                                             style: .default)
                
                alert.addAction(okAction)
                
                self.present(alert, animated: true)
            }
        }
        
        let albumAction = UIAlertAction(title: "앨범에서 가져오기",
                                        style: .default) { (_) in
            self.getImg(sourceType: .photoLibrary)
        }
        
        let cancelAction = UIAlertAction(title: "취소",
                                         style: .cancel)
        
        alert.addAction(cameraAction)
        alert.addAction(albumAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    func getImg(sourceType: UIImagePickerController.SourceType) {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.allowsEditing = true
        picker.delegate = self
        
        self.present(picker, animated: true)
    }
    
}

// MARK: 이미지 피커 컨트롤러 델리게이트 메소드
extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true) {
            let img = info[.editedImage] as? UIImage
            self.imgView.image = img
        }
    }
}

// MARK: 네비게이션 컨트롤러 델리게이트 메소드
extension ViewController:  UINavigationControllerDelegate {
    
}
