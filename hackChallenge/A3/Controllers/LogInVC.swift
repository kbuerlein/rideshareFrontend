//
//  LogInVC.swift
//  RideShare
//
//  Created by L20-US-KBuerlein23-MBA on 4/25/24.
//

import Foundation
import UIKit

class LogInVC: UIViewController {
    
    //MARK: view properties
    private let username = UITextField()
    private let user = UILabel()
    private let logIn = UIButton()
    private let password = UILabel()
    private let passwordText = UITextField()
    
    
    
    //MARK: data properties
    private let userText: String = "Enter Cornell email address:"
    private let userPlace: String = "Type email address here"
    private let logText: String = "Log In"
    private let passText: String = "Enter password:"
    private let passwordPlace: String = "Type password here"
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Log In"
        view.backgroundColor = UIColor.hc.white
        
        setUpUser()
        setUpUsername()
        setUpPassword()
        setUpPasswordText()
        setUpLogIn()
    
    }
    
    
    private func setUpUser() {
        user.text = userText
        user.textColor = UIColor.hc.black
        user.font = .systemFont(ofSize: 24, weight: .semibold).rounded
        
        view.addSubview(user)
        user.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            user.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            user.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 110),
    
        ])
    
        
    }
    
    private func setUpUsername() {
        username.placeholder = userPlace
        username.backgroundColor = UIColor.hc.silver
        username.layer.cornerRadius = 16
        
        view.addSubview(username)
        username.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            username.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            username.topAnchor.constraint(equalTo: user.bottomAnchor, constant: 20),
            username.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            username.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            username.heightAnchor.constraint(equalToConstant: 75),
            
        ])
    
    }
    
    
    private func setUpLogIn() {
        logIn.setTitle(logText, for: .normal)
        logIn.setTitleColor(UIColor.hc.white, for: .normal)
        logIn.backgroundColor = UIColor.hc.navyBlue
        logIn.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        logIn.layer.cornerRadius = 16
        logIn.addTarget(self, action: #selector(pushHomeScreen), for: .touchUpInside)
        
        view.addSubview(logIn)
        logIn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logIn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logIn.topAnchor.constraint(equalTo: passwordText.bottomAnchor, constant: 32),
            logIn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 70),
            logIn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -70),
            logIn.heightAnchor.constraint(equalToConstant: 75),
        ])
    }
    
    private func setUpPassword() {
        password.text = passText
        password.textColor = UIColor.hc.black
        password.font = .systemFont(ofSize: 24, weight: .semibold).rounded
        
        view.addSubview(password)
        password.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            password.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            password.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 32),
            
        ])
    }
    private func setUpPasswordText() {
        passwordText.placeholder = passwordPlace
        passwordText.backgroundColor = UIColor.hc.silver
        passwordText.layer.cornerRadius = 16
        
        view.addSubview(passwordText)
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            passwordText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordText.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 20),
            passwordText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            passwordText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            passwordText.heightAnchor.constraint(equalToConstant: 75),
            
        ])
    }
    
    
    
    @objc private func pushHomeScreen() {
        let username = username.text ?? ""
        let password = passwordText.text ?? ""
        NetworkManager.shared.postAuthentication(username: username, password: password) { ride in
        }
        let homeScreenVC = HomeScreenVC()
        navigationController?.pushViewController(homeScreenVC, animated: true)
        
    
}
}


