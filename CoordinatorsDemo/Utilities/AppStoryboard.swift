//
//  AppStoryboard.swift
//  CoordinatorsDemo
//
//  Created by Ravi Kumar Yaganti on 20/04/21.
//

import UIKit

enum AppStoryboard : String {
    case Auth, Home, Profile, Gallery
    
    var instance : UIStoryboard {
      return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController>(viewControllerClass : T.Type, function : String = #function, line : Int = #line, file : String = #file) -> T {
        
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
         
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
        }
        
        return scene
    }
    
    
    func initialViewController() -> UIViewController? {
        
        return instance.instantiateInitialViewController()
    }
}


/*
 // USAGE :
 let storyboard = AppStoryboard.Main.instance
 // Old Way
 let storyboard = UIStoryboard(name: “Main”, bundle: Bundle.main)
  */
