//
//  DetailViewController.swift
//  WKWebView-Basic
//
//  Created by Fenta on 2020/10/20.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    var movieVO: MovieVO!
    
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        self.navigationItem.title = movieVO.title
        
        if let url = movieVO.detail {
            if let urlObj = URL(string: url) {
                let request = URLRequest(url: urlObj)
                webView.load(request)
            } else {
                let alert = UIAlertController(title: "상세정보 로딩 실패",
                                              message: "잘못된 URL로 접근하였습니다.",
                                              preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "확인",
                                             style: .default) { (_) in
                    _ = self.navigationController?.popViewController(animated: true)
                }
                
                alert.addAction(okAction)
                
                present(alert, animated: true)
            }
        } else {
            let alert = UIAlertController(title: "상세정보 로딩 실패",
                                          message: "URL 정보를 확인할 수 없습니다.",
                                          preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "확인",
                                         style: .default) { (_) in
                _ = self.navigationController?.popViewController(animated: true)
            }
            
            alert.addAction(okAction)
            
            present(alert, animated: true)
        }
    }
    
}
