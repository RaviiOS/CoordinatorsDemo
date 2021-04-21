//
//  ProfileViewController.swift
//  CoordinatorsDemo
//
//  Created by Ravi Kumar Yaganti on 21/04/21.
//

import UIKit

class ProfileViewController: UIViewController, Coordinating {
    // MARK: - Properties
    var coordinator: Coordinator?

    lazy var logOutButton: UIButton = {
        let button = UIButton(frame: CGRect.zero)
        button.backgroundColor = .systemGreen
        button.setTitle("Logout", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var changePassword: UIButton = {
        let button = UIButton(frame: CGRect.zero)
        button.backgroundColor = .systemGreen
        button.setTitle("Change Password", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    // MARK: - View Life Cycle
    fileprivate func setupLogoutButton() {
        logOutButton.addTarget(self, action: #selector(didTapOnLogout), for: .touchUpInside)
        // Do any additional setup after loading the view.
        logOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        logOutButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        logOutButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        logOutButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    fileprivate func setupChangePasswordButton() {
        changePassword.addTarget(self, action: #selector(didTapOnChangePassword), for: .touchUpInside)
        // Do any additional setup after loading the view.
        changePassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        changePassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        changePassword.heightAnchor.constraint(equalToConstant: 44).isActive = true
        changePassword.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.addSubview(logOutButton)
        setupLogoutButton()
        view.addSubview(changePassword)
        setupChangePasswordButton()
    }
    
    @objc func didTapOnLogout() {
        coordinator?.evenOccurred(with: ProfileModule.logout)
    }
    
    @objc func didTapOnChangePassword() {
        coordinator?.evenOccurred(with: ProfileModule.changePassword)
    }
    
}
