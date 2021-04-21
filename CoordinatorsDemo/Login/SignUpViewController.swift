//
//  SignUpViewController.swift
//  CoordinatorsDemo
//
//  Created by Ravi Kumar Yaganti on 20/04/21.
//

import UIKit

class SignUpViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    lazy var termsAndConditionsButton: UIButton = {
        let button = UIButton(frame: CGRect.zero)
        button.setTitle("Terms & Conditions", for: .normal)
        button.backgroundColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    fileprivate func addConstraintsToTermsAndConditionsButton() {
        termsAndConditionsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        termsAndConditionsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        termsAndConditionsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    }
    
    override func viewDidLoad() {
        title = "Sign Up"
        view.addSubview(termsAndConditionsButton)
        termsAndConditionsButton.addTarget(self, action: #selector(didTapOnTermsAndConditions), for: .touchUpInside)
        addConstraintsToTermsAndConditionsButton()
    }
    
    @objc func didTapOnTermsAndConditions() {
        coordinator?.evenOccurred(with: LoginModule.TermsAndConditionsButtonTapped)
    }
}
