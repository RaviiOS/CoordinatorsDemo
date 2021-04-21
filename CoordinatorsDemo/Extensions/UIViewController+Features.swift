//
//  UIViewController+Features.swift
//  CoordinatorsDemo
//
//  Created by Ravi Kumar Yaganti on 20/04/21.
//

import UIKit

extension UIViewController {
   class var storyboardID : String {
    
     return "\(self)"
   }
    
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        
        return appStoryboard.viewController(viewControllerClass: self)
    }

}

// Usage
/*
 let greenScene = GreenVC.instantiate(fromAppStoryboard: .Main)
 let greenScene = AppStoryboard.Main.viewController(viewControllerClass: GreenVC.self)
 let greenScene = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: GreenVC.storyboardID)
 */
