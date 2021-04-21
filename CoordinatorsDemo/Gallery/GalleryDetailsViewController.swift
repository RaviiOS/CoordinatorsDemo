//
//  GalleryDetailsViewController.swift
//  CoordinatorsDemo
//
//  Created by Ravi Kumar Yaganti on 21/04/21.
//

import UIKit

class GalleryDetailsViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    var viewModel: GalleryDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Gallery Details"
        print("Image name is ====>", viewModel.item.imageName)
    }
    
}
