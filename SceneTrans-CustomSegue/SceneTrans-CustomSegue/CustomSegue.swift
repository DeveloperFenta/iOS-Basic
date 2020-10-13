//
//  CustomSegue.swift
//  SceneTrans-CustomSegue
//
//  Created by Fenta on 2020/10/13.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    
    override func perform() {
        let srcUVC = self.source
        
        let destUVC = self.destination
        
        UIView.transition(from: srcUVC.view,
                          to: destUVC.view,
                          duration: 1,
                          options: .transitionCurlDown)
    }
    
}
