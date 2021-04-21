//
//  HomeViewController.swift
//  CoordinatorsDemo
//
//  Created by Ravi Kumar Yaganti on 21/04/21.
//

import UIKit

class HomeViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    lazy var profileButton: UIButton = {
        let button = UIButton(frame: CGRect.zero)
        button.setTitle("Profile", for: .normal)
        button.backgroundColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var galleryButton: UIButton = {
        let button = UIButton(frame: CGRect.zero)
        button.setTitle("Gallery", for: .normal)
        button.backgroundColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.addSubview(profileButton)
        setupProfileConstraints()
        view.addSubview(galleryButton)
        setupGalleryButton()
    }
    
}

extension HomeViewController {
    // MARK: - Custom methods
    private func setupProfileConstraints() {
        profileButton.addTarget(self, action: #selector(didTapOnProfileButton), for: .touchUpInside)
        profileButton.center = view.center //view is your parentView
        profileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        profileButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    private func setupGalleryButton() {
        galleryButton.addTarget(self, action: #selector(didTapOnGalleryButton), for: .touchUpInside)
        galleryButton.center = view.center //view is your parentView
        galleryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        galleryButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        galleryButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 60).isActive = true
    }
    
    
    @objc func didTapOnProfileButton() {
        coordinator?.evenOccurred(with: HomeModule.profile)
    }
    
    @objc func didTapOnGalleryButton() {
        coordinator?.evenOccurred(with: HomeModule.gallery)
    }

}
