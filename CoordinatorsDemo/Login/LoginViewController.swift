//
//  LoginViewController.swift
//  CoordinatorsDemo
//
//  Created by Ravi Kumar Yaganti on 20/04/21.
//

import UIKit

class LoginViewController: UIViewController, Coordinating {
    
    // MARK: - Properties
    var coordinator: Coordinator?

    lazy var signUpButton: UIButton = {
        let myButton = UIButton(frame: CGRect.zero)
        myButton.setTitle("Sign UP", for: .normal)
        myButton.backgroundColor = .systemGreen
        myButton.translatesAutoresizingMaskIntoConstraints = false
        return myButton
    }()
    
    lazy var loginButton: UIButton = {
        let myButton = UIButton(frame: CGRect.zero)
        myButton.setTitle("LOGIN", for: .normal)
        myButton.backgroundColor = .systemGreen
        myButton.translatesAutoresizingMaskIntoConstraints = false
        return myButton
    }()
        
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        view.addSubview(signUpButton)
        view.addSubview(loginButton)
        signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(didTapOnLogin), for: .touchUpInside)
        setupSignUpButtonConstraints()
        setupLoginButtonConstraints()
    }
    
    // MARK: - Custom methods
    fileprivate func setupSignUpButtonConstraints() {
        signUpButton.center = view.center //view is your parentView
        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signUpButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        signUpButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    fileprivate func setupLoginButtonConstraints() {
        loginButton.center = view.center //view is your parentView
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80).isActive = true
    }
    
    @objc func didTapSignUpButton() {
        coordinator?.evenOccurred(with: LoginModule.signUpButtonTapped)
    }
    
    @objc func didTapOnLogin() {
        coordinator?.evenOccurred(with: LoginModule.loginSuccessfull)
    }
}
