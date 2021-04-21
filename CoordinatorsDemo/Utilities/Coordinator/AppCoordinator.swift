//
//  AppCoordinator.swift
//  CoordinatorsDemo
//
//  Created by Ravi Kumar Yaganti on 21/04/21.
//

import Foundation
import UIKit


enum Module: BaseEvent  {
    case login
    case profile
    case home
    case gallery
}

class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    unowned let navigationController:UINavigationController
    var childCoordinator =  [Coordinator]()
    var homeCoordinator: HomeCoordinator?
    var loginCoordinator: LoginCoordinator?
    var profileCoordinator: ProfileCoordinator?
    var galleryCoordinator: GalleryCoordinator?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.homeCoordinator = HomeCoordinator(navigationController: navigationController)
        self.loginCoordinator = LoginCoordinator(navigationController: navigationController)
        self.profileCoordinator = ProfileCoordinator(navigationController: navigationController)
        self.galleryCoordinator = GalleryCoordinator(navigationController: navigationController)
    }

    // MARK: - Navigate based on the events
    func evenOccurred(with type: BaseEvent) {
            switch type as! Module {
            case .login:
                loginCoordinator?.start()
            case .profile:
                profileCoordinator?.start()
            case .home:
                homeCoordinator?.start()
            case .gallery:
                galleryCoordinator?.start()
            }
    }
    
    // MARK: - Setup the default launch view controller
    func start() {
        loginCoordinator?.start()
    }
    
}
