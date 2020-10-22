//
//  MovieDetailViewController.swift
//  InAppFramework-MapKit
//
//  Created by Fenta on 2020/10/22.
//

import UIKit
import WebKit

class MovieDetailViewController: UIViewController {
    
    var mvo = MovieValueObject()
    
    @IBOutlet var webView: WKWebView!
    
    @IBOutlet var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        webView.navigationDelegate = self
        
        self.navigationItem.title = mvo.title
        
        if let url = mvo.detail {
            if let urlObj = URL(string: url) {
                let request = URLRequest(url: urlObj)
                webView.load(request)
            } else {
                alert("잘못된 URL로 접근하였습니다") {
                    _ = self.navigationController?.popViewController(animated: true)
                }
            }
        } else {
            alert("URL 정보를 확인할 수 없습니다") {
                _ = self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
}

//MARK:- Global Alert Function
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
extension MovieDetailViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        indicator.stopAnimating()
        alert("상세 페이지를 읽어오지 못했습니다")
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        indicator.stopAnimating()
        alert("상세 페이지를 읽어오지 못했습니다")
        
        _ = navigationController?.popViewController(animated: true)
    }
    
}
