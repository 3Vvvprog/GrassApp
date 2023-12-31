//
//  ViewController.swift
//  GrassApp
//
//  Created by Вячеслав Вовк on 20.09.2023.
//

import UIKit
import Combine

class RegistrationViewController: UIViewController {
    
    //MARK: - Properties
    var viewModel = ViewModel()
    var cancellables = Set<AnyCancellable>()
    
    // Top Views
    private let topView = UIView()
    
    private let logoLabel = UILabel()
    private let searchLogoButton = UIButton()
    private let searchIcon = UIImageView()
    private let userConfigButton = UIButton()
    private let userConfigView = UIView()
    
    
    //Middle Views
    private var containerStackView =  UIStackView()
    
    private let middleView = UIView()
    private let label = UILabel()
    private let loginTextField = RegisterTextField(placeholder: "Электронная почта")
    private let passwordTextField = RegisterTextField(placeholder: "Пароль")
    private let noRememberPass = UIButton()
    private let loginButton = SetupButton(text: "Войти", typeButton: .green)
    private let createAccountButton = SetupButton(text: "Создать аккаунт", typeButton: .white)
    
    private let googleImage = UIImageView()
    private let googleButton = UIButton()
    
    private let lineView = UIView()
    

    private var isLogin: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = Colors.backgroundColor
        self.hideNavigationBar()
        
        setupLayout()
        bindViewModel()
        
    }

}



private extension RegistrationViewController {
    
    // MARK: - Layout
    func setupLayout() {
        setupTopItemsLayout()
        setupMiddleItemsLayout()
    }
    
    // MARK: - Top Items Layout
    func setupTopItemsLayout() {
        topViewLayout()
        logoLabelLayout()
        userConfigButtonLayout()
        searchLogoButtonLayout()
        
    }
    
    
    // MARK: - TOP ITEMS
    
    func topViewLayout() {
        
        view.addSubview(topView)
        topView.backgroundColor = Colors.mainColorGreen
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
    }
    
    func logoLabelLayout() {
        
        topView.addSubview(logoLabel)
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        logoLabel.text = "GrassJob"
        logoLabel.font = UIFont.boldSystemFont(ofSize: 28)
        logoLabel.textColor = .white
        
        NSLayoutConstraint.activate([
            logoLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 16),
            logoLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor)
        ])
        
    }
    
    func userConfigButtonLayout() {
        topView.addSubview(userConfigView)
        userConfigView.translatesAutoresizingMaskIntoConstraints = false
        userConfigView.backgroundColor = .clear
        
        
        
        userConfigButton.translatesAutoresizingMaskIntoConstraints = false
        userConfigButton.backgroundColor = .clear
        userConfigButton.layer.zPosition = 1000
        
        let line1 = UIView()
        userConfigView.addSubview(line1)
        line1.translatesAutoresizingMaskIntoConstraints = false
        line1.backgroundColor = .white
        line1.layer.cornerRadius = 1
        line1.layer.zPosition = 100
        
        let line2 = UIView()
        userConfigView.addSubview(line2)
        line2.translatesAutoresizingMaskIntoConstraints = false
        line2.backgroundColor = .white
        line2.layer.cornerRadius = 1
        line2.layer.zPosition = 100
        
        let line3 = UIView()
        userConfigView.addSubview(line3)
        line3.translatesAutoresizingMaskIntoConstraints = false
        line3.backgroundColor = .white
        line3.layer.cornerRadius = 1
        line3.layer.zPosition = 100
        
        
        userConfigView.addSubview(userConfigButton)
        
        
        NSLayoutConstraint.activate([
            userConfigView.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -16),
            userConfigView.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            userConfigView.heightAnchor.constraint(equalToConstant: 20),
            userConfigView.widthAnchor.constraint(equalToConstant: 22),
            
            
            userConfigButton.trailingAnchor.constraint(equalTo: userConfigView.trailingAnchor),
            userConfigButton.leadingAnchor.constraint(equalTo: userConfigView.leadingAnchor),
            userConfigButton.topAnchor.constraint(equalTo: userConfigView.topAnchor),
            userConfigButton.bottomAnchor.constraint(equalTo: userConfigView.bottomAnchor),
            
            
            line1.leadingAnchor.constraint(equalTo: userConfigView.leadingAnchor),
            line1.trailingAnchor.constraint(equalTo: userConfigView.trailingAnchor),
            line1.topAnchor.constraint(equalTo: userConfigView.topAnchor),
            line1.heightAnchor.constraint(equalToConstant: 3),
            
            line2.leadingAnchor.constraint(equalTo: userConfigView.leadingAnchor),
            line2.trailingAnchor.constraint(equalTo: userConfigView.trailingAnchor),
            line2.centerYAnchor.constraint(equalTo: userConfigView.centerYAnchor),
            line2.heightAnchor.constraint(equalToConstant: 3),
            
            line3.leadingAnchor.constraint(equalTo: userConfigView.leadingAnchor),
            line3.trailingAnchor.constraint(equalTo: userConfigView.trailingAnchor),
            line3.bottomAnchor.constraint(equalTo: userConfigView.bottomAnchor),
            line3.heightAnchor.constraint(equalToConstant: 3),
        ])
        
        userConfigButton.addTarget(self, action: #selector(userConfigButtonAction), for: .touchUpInside)
        
    }
    
    func searchLogoButtonLayout() {
        
        
        topView.addSubview(searchIcon)
        searchIcon.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(weight: .medium)
        searchIcon.image = UIImage(systemName: "magnifyingglass", withConfiguration: config)
       
        searchIcon.tintColor = .white
        
        
        topView.addSubview(searchLogoButton)
        searchLogoButton.translatesAutoresizingMaskIntoConstraints = false
        searchLogoButton.backgroundColor = .clear
        
       
        NSLayoutConstraint.activate([
            searchIcon.trailingAnchor.constraint(equalTo: userConfigView.leadingAnchor, constant: -24),
            searchIcon.heightAnchor.constraint(equalToConstant: 25),
            searchIcon.widthAnchor.constraint(equalToConstant: 25),
            searchIcon.centerYAnchor.constraint(equalTo: userConfigView.centerYAnchor),
            
            searchLogoButton.trailingAnchor.constraint(equalTo: userConfigView.leadingAnchor, constant: -24),
            searchLogoButton.heightAnchor.constraint(equalToConstant: 25),
            searchLogoButton.widthAnchor.constraint(equalToConstant: 25),
            searchLogoButton.centerYAnchor.constraint(equalTo: userConfigView.centerYAnchor),
            
        ])
        
        
        searchLogoButton.addTarget(self, action: #selector(userConfigButtonAction), for: .touchUpInside)
    }
    
    
    // MARK: - Middle Items Layout
    
    func setupMiddleItemsLayout() {
        mainViewLayout()
        labelLayout()
        loginTextFieldLayout()
        passwordTextFieldLayout()
        noRememberPassLayout()
        loginButtonLayout()
        createAccountButtonLayout()
        lineViewLayout()
        googleLayout()
    }
    
    func mainViewLayout() {
        view.addSubview(middleView)
        middleView.translatesAutoresizingMaskIntoConstraints = false
        middleView.backgroundColor = .white
        middleView.layer.cornerRadius = 20
        
        NSLayoutConstraint.activate([
            middleView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 32),
            middleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            middleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            middleView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
        ])
    }
    
    
    func labelLayout() {
        middleView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Вход в аккаунт"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        
        NSLayoutConstraint.activate([
        
            label.topAnchor.constraint(equalTo: middleView.topAnchor, constant: 36),
            label.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -16),
        ])
    }
    
    
    func loginTextFieldLayout() {
        middleView.addSubview(loginTextField)
        
        NSLayoutConstraint.activate([
            loginTextField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 32),
            loginTextField.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -16),
            loginTextField.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 16),
            loginTextField.heightAnchor.constraint(equalToConstant: 54),
            
        ])
    }
    
    
    func passwordTextFieldLayout() {
        middleView.addSubview(passwordTextField)
        passwordTextField.isSecureTextEntry = true
       
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 12),
            passwordTextField.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -16),
            passwordTextField.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
    
    func noRememberPassLayout() {
        middleView.addSubview(noRememberPass)
        noRememberPass.translatesAutoresizingMaskIntoConstraints = false
        noRememberPass.setTitle("Не помню пароль", for: .normal)
        noRememberPass.setTitleColor(Colors.mainColorGreen, for: .normal)
        noRememberPass.titleLabel?.font = UIFont(name: "Gilroy-Medium", size: 16)
        
        NSLayoutConstraint.activate([
            noRememberPass.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 16),
            noRememberPass.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 14)
        ])
        
    }
    
    func loginButtonLayout() {
        middleView.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 16),
            loginButton.topAnchor.constraint(equalTo: noRememberPass.bottomAnchor, constant: 24),
            loginButton.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        
        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        
    }
    
    func createAccountButtonLayout() {
        middleView.addSubview(createAccountButton)
        
        NSLayoutConstraint.activate([
            createAccountButton.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 16),
            createAccountButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 12),
            createAccountButton.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -16),
            createAccountButton.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        
        createAccountButton.addTarget(self, action: #selector(createAccountButtonAction), for: .touchUpInside)
        
        
    }
    
    func lineViewLayout() {
        middleView.addSubview(lineView)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = .clear
        
        let line1Or = UIView()
        let labelOr = UILabel()
        let line2Or = UIView()
        let label3 = UILabel()
        
        lineView.addSubview(labelOr)
        lineView.addSubview(line1Or)
        lineView.addSubview(line2Or)
        middleView.addSubview(label3)
        
        line1Or.translatesAutoresizingMaskIntoConstraints = false
        line2Or.translatesAutoresizingMaskIntoConstraints = false
        labelOr.translatesAutoresizingMaskIntoConstraints = false
        label3.translatesAutoresizingMaskIntoConstraints = false
        
        line1Or.backgroundColor = .lightGray
        line2Or.backgroundColor = .lightGray
        
        labelOr.text = "или"
        labelOr.textColor = .lightGray
        labelOr.font = UIFont.systemFont(ofSize: 14)
        
        label3.text = "Войти с помощью"
        label3.textColor = .black
        label3.font = UIFont.systemFont(ofSize: 14)
        
        NSLayoutConstraint.activate([
            lineView.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 16),
            lineView.topAnchor.constraint(equalTo: createAccountButton.bottomAnchor, constant: 24),
            lineView.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -16),
            lineView.heightAnchor.constraint(equalToConstant: 20),
            
            
            
            labelOr.centerXAnchor.constraint(equalTo: lineView.centerXAnchor),
            labelOr.centerYAnchor.constraint(equalTo: lineView.centerYAnchor),
            
            
            line1Or.leadingAnchor.constraint(equalTo: lineView.leadingAnchor),
            line1Or.trailingAnchor.constraint(equalTo: labelOr.leadingAnchor, constant: -12),
            line1Or.centerYAnchor.constraint(equalTo: lineView.centerYAnchor),
            line1Or.heightAnchor.constraint(equalToConstant: 1),
            
            line2Or.trailingAnchor.constraint(equalTo: lineView.trailingAnchor),
            line2Or.leadingAnchor.constraint(equalTo: labelOr.trailingAnchor, constant: 12),
            line2Or.centerYAnchor.constraint(equalTo: lineView.centerYAnchor),
            line2Or.heightAnchor.constraint(equalToConstant: 1),
            
            
            label3.centerXAnchor.constraint(equalTo: middleView.centerXAnchor),
            label3.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 24)
        ])
        
        
    }
    
    
    func googleLayout() {
        middleView.addSubview(googleImage)
        googleImage.translatesAutoresizingMaskIntoConstraints = false
        googleImage.image = UIImage(named: "Google1")
        
        NSLayoutConstraint.activate([
            googleImage.centerXAnchor.constraint(equalTo: middleView.centerXAnchor),
            googleImage.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 60)
        ])
        
        
    }
    
    
}



// MARK: - Buttons Action

private extension RegistrationViewController {
    @objc func userConfigButtonAction() {
        if view.backgroundColor == .black {
            view.backgroundColor = .white
        }else {
            view.backgroundColor = .black
        }
        
    }
    
    @objc func loginButtonAction() {
        
        if !isLogin {
            loginButton.setTitle("Loading...", for: .normal)
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) { [weak self] in
                self?.loginTextField.layer.borderColor = UIColor.systemRed.cgColor
                self?.loginButton.setTitle("Войти", for: .normal)
            }
            
        }else {
            viewModel.submitLogin()
        }
        
        
        
    }
    
    @objc func createAccountButtonAction() {
        let createAccountViewController = CreateAccountViewController()
        createAccountViewController.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(createAccountViewController, animated: true)
        
    }
    
    
}



// MARK: ViewModel Binding

private extension RegistrationViewController {
    func bindViewModel() {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: loginTextField)
            .map { ($0.object as! UITextField).text ?? "" }
            .assign(to: \.email, on: viewModel)
            .store(in: &cancellables)
        
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: passwordTextField)
            .map { ($0.object as! UITextField).text ?? "" }
            .assign(to: \.password, on: viewModel)
            .store(in: &cancellables)
        
            

        viewModel.isValidEmailPublisher
            .assign(to: \.isLogin, on: self)
            .store(in: &cancellables)
        
        viewModel.isLoginEnabled
            .sink(receiveValue: {  _ in
                if self.loginButton.isEnabled {
                    self.loginButton.backgroundColor = Colors.mainColorGreen
                }else {
                    self.loginButton.backgroundColor = Colors.mainColorGreen
                }
                
            })
            .store(in: &cancellables)
        
        
         
        viewModel.$state
            .sink { [weak self] state in
                switch state {
                case .loading:
                    self?.loginButton.isEnabled = false
                    self?.loginButton.setTitle("Loading...", for: .normal)
                case .success:
                    self?.loginButton.setTitle("Login success", for: .normal)
                    let homeViewController = HomeViewController()
                    homeViewController.modalPresentationStyle = .fullScreen
                    self?.present(homeViewController, animated: true)
                case .failed:
                    self?.loginButton.backgroundColor = Colors.mainColorGreen
                    self?.loginButton.setTitle("Try again", for: .normal)
                    self?.loginTextField.layer.borderColor = UIColor.systemRed.cgColor
                    self?.passwordTextField.layer.borderColor = UIColor.systemRed.cgColor
                    self?.loginButton.isEnabled = true
                case .none:
                    break
                }
                
            }
            .store(in: &cancellables)
    }
}
