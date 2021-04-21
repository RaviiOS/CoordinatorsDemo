//
//  HomeCoordinator.swift
//  CoordinatorsDemo
//
//  Created by Ravi Kumar Yaganti on 21/04/21.
//

import Foundation
import UIKit

enum HomeModule: BaseEvent {
    case home
    case profile
    case gallery
}

class HomeCoordinator: Coordinator {
    var childCoordinator = [Coordinator]()
    unowned let navigationController:UINavigationController

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func evenOccurred(with type: BaseEvent) {
        switch type as! HomeModule {
        case .profile:
            let profileCoordinator = ProfileCoordinator(navigationController: navigationController)
            profileCoordinator.start()
        case .home:
            var homeVC: UIViewController & Coordinating = HomeViewController.instantiate(fromAppStoryboard: .Home)
            homeVC.coordinator = self
            navigationController.pushViewController(homeVC, animated: true)
        case .gallery:
            let galleryCoordinator = GalleryCoordinator(navigationController: navigationController)
            galleryCoordinator.start()
        }
    }
    
    func start() {
        var homeVC: UIViewController & Coordinating = HomeViewController.instantiate(fromAppStoryboard: .Home)
        homeVC.coordinator = self
        navigationController.pushViewController(homeVC, animated: true)
    }
    
    
}
