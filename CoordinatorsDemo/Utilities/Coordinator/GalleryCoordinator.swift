//
//  GalleryCoordinator.swift
//  CoordinatorsDemo
//
//  Created by Ravi Kumar Yaganti on 21/04/21.
//

import Foundation
import UIKit

enum GalleryModule: BaseEvent  {
    case galleryList
    case galleryDetails(galleryItem: Item)
}

class GalleryCoordinator: NSObject, Coordinator {
    unowned let navigationController:UINavigationController
    var childCoordinator = [Coordinator]()
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func evenOccurred(with type: BaseEvent) {
        switch type as! GalleryModule {
        case .galleryList:
            let galleryListVC: GalleryListViewController & Coordinating = GalleryListViewController.instantiate(fromAppStoryboard: .Gallery)
            galleryListVC.coordinator = self
            let galleryItems = GalleryItems.getDummyData()
            galleryListVC.viewModel = GalleryViewModel(galleryItems: galleryItems)
            navigationController.pushViewController(galleryListVC, animated: true)
        case .galleryDetails(let item):
            let galleryDetailsVC: GalleryDetailsViewController & Coordinating = GalleryDetailsViewController.instantiate(fromAppStoryboard: .Gallery)
            galleryDetailsVC.coordinator = self
            galleryDetailsVC.viewModel = GalleryDetailsViewModel(item: item)
            navigationController.pushViewController(galleryDetailsVC, animated: true)
        }
    }
    
    func start() {
        var galleryListVC: UIViewController & Coordinating = GalleryListViewController.instantiate(fromAppStoryboard: .Gallery)
        galleryListVC.coordinator = self
        navigationController.pushViewController(galleryListVC, animated: true)
    }
}
