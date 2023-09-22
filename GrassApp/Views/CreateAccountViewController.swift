//
//  CreateAccountViewController.swift
//  GrassApp
//
//  Created by Вячеслав Вовк on 21.09.2023.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    //MARK: - Properties
    
    // Top Views
    private let topView = UIView()
    
    private let logoLabel = UILabel()
    private let searchLogoButton = UIButton()
    private let searchIcon = UIImageView()
    private let userConfigButton = UIButton()
    private let userConfigView = UIView()
    
    
    // Middle Views
    private let middleView = UIView()
    private let topLabel = UILabel()
    private let littleLabel = UILabel()
    private let toggleView = UIView()
    private let leadingToggleButton = UIButton()
    private let trailingToggleButton = UIButton()
    
    private let continueButton = UIButton()
    private let backButton = UIButton()
    
    private var isLeftActive: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.backgroundColor
        
        setupLayout()
    }
}

private extension CreateAccountViewController {
    
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
    
    // MARK: - Middle Items Layout
    func setupMiddleItemsLayout() {
        middleViewLayout()
        labelLayout()
        littleLabelLayout()
        toggleViewLayout()
        leadingToggleButtonLayout()
        trailingToggleButtonLayout()
        continueButtonLayout()
        backButtonLayout()
        
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
        
        
    }
    
    
    // MARK: - MIDDLE ITEMS
    
    func middleViewLayout() {
        
        view.addSubview(middleView)
        middleView.backgroundColor = .white
        middleView.translatesAutoresizingMaskIntoConstraints = false
        middleView.layer.cornerRadius = 20
        
        
        NSLayoutConstraint.activate([
            middleView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 32),
            middleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            middleView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            middleView.heightAnchor.constraint(equalToConstant: 360)
        ])
        
    }
    
    
    func labelLayout() {
        middleView.addSubview(topLabel)
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.text = "Создание аккаунта"
        topLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        NSLayoutConstraint.activate([
        
            topLabel.topAnchor.constraint(equalTo: middleView.topAnchor, constant: 36),
            topLabel.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 16),
            topLabel.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -16),
        ])
    }
    
    
    func littleLabelLayout() {
        middleView.addSubview(littleLabel)
        littleLabel.translatesAutoresizingMaskIntoConstraints =  false
        littleLabel.text = "Для чего вы создаете аккаунт?"
        littleLabel.textColor = UIColor(red: 0.417, green: 0.431, blue: 0.438, alpha: 1)
        
        NSLayoutConstraint.activate([
            littleLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 32),
            littleLabel.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 16)
        ])
        
    }
    
    func toggleViewLayout() {
        middleView.addSubview(toggleView)
        toggleView.translatesAutoresizingMaskIntoConstraints = false
        toggleView.layer.borderWidth = 1
        toggleView.layer.borderColor = UIColor(red: 0.832, green: 0.862, blue: 0.871, alpha: 1).cgColor
        toggleView.layer.cornerRadius = 14
        
        NSLayoutConstraint.activate([
            toggleView.topAnchor.constraint(equalTo: littleLabel.bottomAnchor, constant: 8),
            toggleView.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 16),
            toggleView.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -16),
            toggleView.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
    
    func leadingToggleButtonLayout() {
        
        toggleView.addSubview(leadingToggleButton)
        leadingToggleButton.translatesAutoresizingMaskIntoConstraints = false
        leadingToggleButton.setTitle("Ищу работу", for: .normal)
        leadingToggleButton.backgroundColor = Colors.buttonGray
        leadingToggleButton.setTitleColor(.black, for: .normal)
        leadingToggleButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        leadingToggleButton.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            leadingToggleButton.topAnchor.constraint(equalTo: toggleView.topAnchor, constant: 4),
            leadingToggleButton.leadingAnchor.constraint(equalTo: toggleView.leadingAnchor, constant: 4),
            leadingToggleButton.trailingAnchor.constraint(equalTo: toggleView.centerXAnchor),
            leadingToggleButton.bottomAnchor.constraint(equalTo: toggleView.bottomAnchor, constant: -4)
        ])
        
        leadingToggleButton.addTarget(self, action: #selector(leadingToggleButtonAction), for: .touchUpInside)
        
    }
    
    func trailingToggleButtonLayout() {
        
        toggleView.addSubview(trailingToggleButton)
        trailingToggleButton.translatesAutoresizingMaskIntoConstraints = false
        trailingToggleButton.setTitle("Ищу сотрудников", for: .normal)
        trailingToggleButton.backgroundColor = .clear
        trailingToggleButton.setTitleColor(.lightGray, for: .normal)
        trailingToggleButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        trailingToggleButton.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            trailingToggleButton.topAnchor.constraint(equalTo: toggleView.topAnchor, constant: 4),
            trailingToggleButton.trailingAnchor.constraint(equalTo: toggleView.trailingAnchor, constant: -4),
            trailingToggleButton.leadingAnchor.constraint(equalTo: toggleView.centerXAnchor),
            trailingToggleButton.bottomAnchor.constraint(equalTo: toggleView.bottomAnchor, constant: -4)
        ])
        
        trailingToggleButton.addTarget(self, action: #selector(trailingToggleButtonAction), for: .touchUpInside)
        
    }
    
    
    func continueButtonLayout() {
        middleView.addSubview(continueButton)
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.setTitle("Продолжить", for: .normal)
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        continueButton.backgroundColor = Colors.mainColorGreen
        continueButton.layer.cornerRadius = 14
        
        NSLayoutConstraint.activate([
            continueButton.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 16),
            continueButton.topAnchor.constraint(equalTo: toggleView.bottomAnchor, constant: 24),
            continueButton.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -16),
            continueButton.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        
        
    }
    
    func backButtonLayout() {
        middleView.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setTitle("Войти в аккаунт", for: .normal)
        backButton.setTitleColor(Colors.mainColorGreen, for: .normal)
        backButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        backButton.backgroundColor = .white
        backButton.layer.cornerRadius = 14
        backButton.layer.borderColor = Colors.mainColorGreen.cgColor
        backButton.layer.borderWidth = 1
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 16),
            backButton.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 12),
            backButton.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -16),
            backButton.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        
    }
    
    
}

private extension CreateAccountViewController {
    @objc func leadingToggleButtonAction() {
        
        trailingToggleButton.backgroundColor = .clear
        trailingToggleButton.setTitleColor(.lightGray, for: .normal)
        leadingToggleButton.backgroundColor = Colors.buttonGray
        leadingToggleButton.setTitleColor(.black, for: .normal)
        isLeftActive = true
    }
    
    @objc func trailingToggleButtonAction() {
        
        leadingToggleButton.backgroundColor = .clear
        leadingToggleButton.setTitleColor(.lightGray, for: .normal)
        trailingToggleButton.backgroundColor = Colors.buttonGray
        trailingToggleButton.setTitleColor(.black, for: .normal)
        isLeftActive = false
    }
    
    @objc func backButtonAction() {
        
        dismiss(animated: true)
    }
}
