//
//  DetailViewController.swift
//  WKWebView-Delegate
//
//  Created by Fenta on 2020/10/20.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    var movieVO: MovieVO!
    
    @IBOutlet var webView: WKWebView!
    
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        webView.navigationDelegate = self
        webView.uiDelegate = self
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

//MARK:- Warning Alert Extension
extension UIViewController {
    func alert(_ message: String, onClick: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: nil,
                                                message: message,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .cancel, handler: { (_) in
            onClick?()
        }))
        
        DispatchQueue.main.async {
            self.present(alertController, animated: true)
        }
    }
}

//MARK:- Implement WKNavigationDelegate Protocol
extension DetailViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        spinner.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        spinner.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        spinner.stopAnimating()
        alert("상세 페이지를 읽어오지 못했습니다")
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        spinner.stopAnimating()
        alert("상세 페이지를 읽어오지 못했습니다")
        
        _ = navigationController?.popViewController(animated: true)
    }
}

//MARK:- Implement WKUIDelegate Protocol
extension DetailViewController: WKUIDelegate {
    
}
