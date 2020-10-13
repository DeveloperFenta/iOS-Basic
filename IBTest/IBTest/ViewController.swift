//
//  ViewController.swift
//  IBTest
//
//  Created by Fenta on 2020/10/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var uiTitle01: UILabel!
    var isClicked01 = false
    
    @IBOutlet var uiTitle02: UILabel!
    var isClicked02 = false
    
    @IBOutlet var uiTitle03: UILabel!
    var isClicked03 = false
    
    @IBOutlet var uiTitle04: UILabel!
    var isClicked04 = false
    
    @IBOutlet var uiTitle05: UILabel!
    var isClicked05 = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickBtn01(_ sender: Any) {
        if isClicked01 {
            self.uiTitle01.text = "Label 01"
        } else {
            self.uiTitle01.text = "Clicked!"
        }
        
        isClicked01.toggle()
    }
    
    @IBAction func clickBtn02(_ sender: Any) {
        if isClicked02 {
            self.uiTitle02.text = "Label 02"
        } else {
            self.uiTitle02.text = "Clicked!"
        }
        
        isClicked02.toggle()
    }
    
    @IBAction func clickBtn03(_ sender: Any) {
        if isClicked03 {
            self.uiTitle03.text = "Label 03"
        } else {
            self.uiTitle03.text = "Clicked!"
        }
        
        isClicked03.toggle()
    }
    
    @IBAction func clickBtn04(_ sender: Any) {
        if isClicked04 {
            self.uiTitle04.text = "Label 04"
        } else {
            self.uiTitle04.text = "Clicked!"
        }
        
        isClicked04.toggle()
    }
    
    @IBAction func clickBtn05(_ sender: Any) {
        if isClicked05 {
            self.uiTitle05.text = "Label 05"
        } else {
            self.uiTitle05.text = "Clicked!"
        }
        
        isClicked05.toggle()
    }
    
}

