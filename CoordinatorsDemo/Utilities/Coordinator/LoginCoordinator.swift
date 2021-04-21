//
//  LoginCoordinator.swift
//  CoordinatorsDemo
//
//  Created by Ravi Kumar Yaganti on 21/04/21.
//

import Foundation
import UIKit

enum LoginModule: BaseEvent  {
    case signUpButtonTapped
    case TermsAndConditionsButtonTapped
    case loginSuccessfull
    
//    var description: String {
//        switch self {
//        case .signUpButtonTapped:
//            return "SignUp View"
//        case .TermsAndConditionsButtonTapped:
//            return "Terms and Conditions View"
//        case .loginSuccessfull:
//            return "Login successful"
//        }
//    }
}

class LoginCoordinator: NSObject, Coordinator {
    unowned let navigationController:UINavigationController
    var childCoordinator = [Coordinator]()
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func evenOccurred(with type: BaseEvent) {
        switch type as! LoginModule {
        case .signUpButtonTapped:
            var signUpVC: UIViewController & Coordinating = SignUpViewController.instantiate(fromAppStoryboard: .Auth)
            signUpVC.coordinator = self
            navigationController.pushViewController(signUpVC, animated: true)
        case .TermsAndConditionsButtonTapped:
            var termsVC: UIViewController & Coordinating = TermsAndConditionsViewController.instantiate(fromAppStoryboard: .Auth)
            termsVC.coordinator = self
            navigationController.pushViewController(termsVC, animated: true)
        case .loginSuccessfull:
            let homeCoordinator = HomeCoordinator(navigationController: navigationController)
            homeCoordinator.start()
        }
    }
    
    func start() {
        var loginViewController: UIViewController & Coordinating = LoginViewController.instantiate(fromAppStoryboard: .Auth)
        loginViewController.coordinator = self
        navigationController.setViewControllers([loginViewController], animated: false)
    }
}
