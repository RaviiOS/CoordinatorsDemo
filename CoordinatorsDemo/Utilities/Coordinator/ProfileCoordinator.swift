//
//  ProfileCoordinator.swift
//  CoordinatorsDemo
//
//  Created by Ravi Kumar Yaganti on 21/04/21.
//

import Foundation
import UIKit


enum ProfileModule: BaseEvent  {
    case profile
    case changePassword
    case logout
}

class ProfileCoordinator: NSObject, Coordinator {
    unowned let navigationController:UINavigationController
    var childCoordinator = [Coordinator]()
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func evenOccurred(with type: BaseEvent) {
        switch type as! ProfileModule {
        case .profile:
            var profileVC: UIViewController & Coordinating = ProfileViewController.instantiate(fromAppStoryboard: .Profile)
            profileVC.coordinator = self
            navigationController.pushViewController(profileVC, animated: true)
        case .changePassword:
            var changePasswordVC: UIViewController & Coordinating = ChangePasswordViewController.instantiate(fromAppStoryboard: .Profile)
            changePasswordVC.coordinator = self
            navigationController.pushViewController(changePasswordVC, animated: true)
        case .logout:
            let loginCoordinator = LoginCoordinator(navigationController: navigationController)
            loginCoordinator.start()
        }
    }
    
    func start() {
        var profileVC: UIViewController & Coordinating = ProfileViewController.instantiate(fromAppStoryboard: .Profile)
        profileVC.coordinator = self
        navigationController.pushViewController(profileVC, animated: true)
    }
}
