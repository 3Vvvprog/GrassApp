//
//  CreateAccountViewController.swift
//  GrassApp
//
//  Created by Вячеслав Вовк on 21.09.2023.
//

import UIKit
import Combine
import MessageUI



class CreateAccountViewController: UIViewController {
    
    private let viewModel = ViewModel()
    private var cancellables = Set<AnyCancellable>()
    
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
    
    private let continueButton = SetupButton(text: "Продолжить", typeButton: .green)
    private let backToLoginButton = SetupButton(text: "Войти в аккаунт", typeButton: .white)
    
    private var isLeftActive: Bool = true
    private var isMenActive: Bool = true
    
    
    // Middle Two Views
    private let middleViewTwo = UIView()
    private let topLabelTwo = UILabel()
    private let littleLabelTwo = UILabel()
    
    private let emailTextFieldTwo = RegisterTextField(placeholder: "Электронная почта")
    private let takeCodeButton = SetupButton(text: "Получить код", typeButton: .green)
    private let backButtonTwo = SetupButton(text: "Назад", typeButton: .white)
    
    
    // Middle Three Views
    private let middleViewThree = UIView()
    private let topLabelThree = UILabel()
    private let littleLabelThree = UILabel()
    
    private var isCodeEntered = false
    
    private let codeTextFieldThree = RegisterTextField(placeholder: "4 цифры")
    private let codeTimeLeftLabel = UILabel()
    private var timer: Timer?
    private var timeInterval: TimeInterval = 5
    private var isTimerActive = true
    private let takeCodeAgain = UIButton()
    private let continueButtonThree = SetupButton(text: "Продолжить", typeButton: .green)
    private let backButtonThree = SetupButton(text: "Назад", typeButton: .white)
    
    
    // Middle Four Views
    private let middleViewFour = UIView()
    private let topLabelFour = UILabel()
    private let littleLabelFour = UILabel()
    
    private let createPasswordTextField = RegisterTextField(placeholder: "Пароль")
    private let repeatPasswordTextField = RegisterTextField(placeholder: "Повторите пароль")
    
    private let continueButtonFour = SetupButton(text: "Продолжить", typeButton: .green)
    private let backButtonFour = SetupButton(text: "Назад", typeButton: .white)
    
    
    
    // Middle Five For Person
    private let middleViewFive = UIView()
    private let topLabelFive = UILabel()
    
    private let firstNameTextField = RegisterTextField(placeholder: "Имя")
    private let secondNameTextField = RegisterTextField(placeholder: "Фамилия")
    
    private let dateOfBirsdayLabel = UILabel()
    private let dateOfBirsdayTextField = RegisterTextField(placeholder: "ДД.ММ.ГГГГ")
    
    
    private let sexLabel = UILabel()
    private let toggleSexView = UIView()
    private let menToggleButton = UIButton()
    private let womenToggleButton = UIButton()
    
    private let personFinishRegisteringButton = SetupButton(text: "Завершить регистрацию", typeButton: .green)
    private let backButtonFive = SetupButton(text: "Назад", typeButton: .white)
    
    
    
    // Middle Six For Company
    private let middleViewSix = UIView()
    private let topLabelSix = UILabel()
    
    private let companyNameLabel = UILabel()
    private let companyNameTextField = RegisterTextField(placeholder: "Название компании")
    
    private let innLabel = UILabel()
    private let innTextField = RegisterTextField(placeholder: "000000000000")
    
    
    private let companyFinishRegisteringButton = SetupButton(text: "Завершить регистрацию", typeButton: .green)
    private let backButtonSix = SetupButton(text: "Назад", typeButton: .white)
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.backgroundColor
        self.hideNavigationBar()
        setupLayout()
        binViewModel()
    }
    
}

private extension CreateAccountViewController {
    
    // MARK: - Setup Middle Items
    
    func setupLayout() {
        setupTopItemsLayout()
        setupMiddleItemsLayout()
        middleItemsTwo()
        middleItemsThree()
        middleItemsFour()
        middleItemsFive()
        middleItemsSix()
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
        
        NSLayoutConstraint.activate([
            continueButton.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 16),
            continueButton.topAnchor.constraint(equalTo: toggleView.bottomAnchor, constant: 24),
            continueButton.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -16),
            continueButton.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        continueButton.addTarget(self, action: #selector(continueButtonAction), for: .touchUpInside)
        
        
    }
    
    func backButtonLayout() {
        middleView.addSubview(backToLoginButton)
        
        NSLayoutConstraint.activate([
            backToLoginButton.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 16),
            backToLoginButton.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 12),
            backToLoginButton.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -16),
            backToLoginButton.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        backToLoginButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        
    }
    
    
}

// MARK: - Middle Items Two
private extension CreateAccountViewController {
    
    
    func middleItemsTwo() {
        middleViewTwoLayout()
        labelTwoLayout()
        littleLabelTwoLayout()
        loginTextFieldLayout()
        takeCodeButtonLayout()
        backButtonTwoLayout()
    }
    
    
    func middleViewTwoLayout() {
        
        view.addSubview(middleViewTwo)
        middleViewTwo.backgroundColor = .white
        middleViewTwo.translatesAutoresizingMaskIntoConstraints = false
        middleViewTwo.layer.cornerRadius = 20
        middleViewTwo.isHidden = true
        
        
        NSLayoutConstraint.activate([
            middleViewTwo.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 32),
            middleViewTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            middleViewTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            middleViewTwo.heightAnchor.constraint(equalToConstant: 380)
        ])
        
    }
    
    
    func labelTwoLayout() {
        middleViewTwo.addSubview(topLabelTwo)
        topLabelTwo.translatesAutoresizingMaskIntoConstraints = false
        topLabelTwo.text = "Создание аккаунта"
        topLabelTwo.font = UIFont.boldSystemFont(ofSize: 24)
        
        NSLayoutConstraint.activate([
        
            topLabelTwo.topAnchor.constraint(equalTo: middleViewTwo.topAnchor, constant: 36),
            topLabelTwo.leadingAnchor.constraint(equalTo: middleViewTwo.leadingAnchor, constant: 16),
            topLabelTwo.trailingAnchor.constraint(equalTo: middleViewTwo.trailingAnchor, constant: -16),
        ])
    }
    
    
    func littleLabelTwoLayout() {
        middleViewTwo.addSubview(littleLabelTwo)
        littleLabelTwo.translatesAutoresizingMaskIntoConstraints =  false
        littleLabelTwo.textColor = UIColor(red: 0.417, green: 0.431, blue: 0.438, alpha: 1)
        littleLabelTwo.numberOfLines = 0
        littleLabelTwo.lineBreakMode = .byWordWrapping
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.19
        // Line height: 20 pt
        littleLabelTwo.attributedText = NSMutableAttributedString(string: "На данную почту придёт письмо с кодом подтверждения", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        NSLayoutConstraint.activate([
            littleLabelTwo.topAnchor.constraint(equalTo: topLabelTwo.bottomAnchor, constant: 32),
            littleLabelTwo.leadingAnchor.constraint(equalTo: middleViewTwo.leadingAnchor, constant: 16),
            littleLabelTwo.trailingAnchor.constraint(equalTo: middleViewTwo.trailingAnchor, constant: -16)
        ])
        
    }
    
    
    func loginTextFieldLayout() {
        middleViewTwo.addSubview(emailTextFieldTwo)
        
       
        
        NSLayoutConstraint.activate([
            emailTextFieldTwo.topAnchor.constraint(equalTo: littleLabelTwo.bottomAnchor, constant: 8),
            emailTextFieldTwo.trailingAnchor.constraint(equalTo: middleViewTwo.trailingAnchor, constant: -16),
            emailTextFieldTwo.leadingAnchor.constraint(equalTo: middleViewTwo.leadingAnchor, constant: 16),
            emailTextFieldTwo.heightAnchor.constraint(equalToConstant: 54),
            
        ])
    }
    
    func takeCodeButtonLayout() {
        middleViewTwo.addSubview(takeCodeButton)
        
        NSLayoutConstraint.activate([
            takeCodeButton.topAnchor.constraint(equalTo: emailTextFieldTwo.bottomAnchor, constant: 12),
            takeCodeButton.leadingAnchor.constraint(equalTo: middleViewTwo.leadingAnchor, constant: 16),
            takeCodeButton.trailingAnchor.constraint(equalTo: middleViewTwo.trailingAnchor, constant: -16),
            takeCodeButton.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        takeCodeButton.addTarget(self, action: #selector(continueButtonTwoAction), for: .touchUpInside)
        
        takeCodeButton.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
    }
    
    
    func backButtonTwoLayout() {
        middleViewTwo.addSubview(backButtonTwo)
        
        NSLayoutConstraint.activate([
            backButtonTwo.topAnchor.constraint(equalTo: takeCodeButton.bottomAnchor, constant: 12),
            backButtonTwo.leadingAnchor.constraint(equalTo: middleViewTwo.leadingAnchor, constant: 16),
            backButtonTwo.trailingAnchor.constraint(equalTo: middleViewTwo.trailingAnchor, constant: -16),
            backButtonTwo.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        backButtonTwo.addTarget(self, action: #selector(backButtonTwoAction), for: .touchUpInside)
    }
}



// MARK: - Middle Items Three
private extension CreateAccountViewController {
    
    
    func middleItemsThree() {
        middleViewThreeLayout()
        labelThreeLayout()
        littleLabelThreeLayout()
        codeTextFieldThreeLayout()
        codeTimeLeftLabelLayout()
        takeCodeAgainLayout()
        continueButtonThreeLayout()
        backButtonThreeLayout()
    }
    
    
    func middleViewThreeLayout() {
        
        view.addSubview(middleViewThree)
        middleViewThree.backgroundColor = .white
        middleViewThree.translatesAutoresizingMaskIntoConstraints = false
        middleViewThree.layer.cornerRadius = 20
        middleViewThree.isHidden = true
        
        
        NSLayoutConstraint.activate([
            middleViewThree.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 32),
            middleViewThree.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            middleViewThree.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            middleViewThree.heightAnchor.constraint(equalToConstant: 424)
        ])
        
    }
    
    
    func labelThreeLayout() {
        middleViewThree.addSubview(topLabelThree)
        topLabelThree.translatesAutoresizingMaskIntoConstraints = false
        topLabelThree.text = "Создание аккаунта"
        topLabelThree.font = UIFont.boldSystemFont(ofSize: 24)
        
        NSLayoutConstraint.activate([
        
            topLabelThree.topAnchor.constraint(equalTo: middleViewThree.topAnchor, constant: 36),
            topLabelThree.leadingAnchor.constraint(equalTo: middleViewThree.leadingAnchor, constant: 16),
            topLabelThree.trailingAnchor.constraint(equalTo: middleViewThree.trailingAnchor, constant: -16),
        ])
    }
    
    
    func littleLabelThreeLayout() {
        middleViewThree.addSubview(littleLabelThree)
        littleLabelThree.translatesAutoresizingMaskIntoConstraints =  false
        littleLabelThree.textColor = UIColor(red: 0.417, green: 0.431, blue: 0.438, alpha: 1)
        littleLabelThree.numberOfLines = 0
        littleLabelThree.lineBreakMode = .byWordWrapping
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.19
        // Line height: 20 pt
        littleLabelThree.attributedText = NSMutableAttributedString(string: "Введите код из письма", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        NSLayoutConstraint.activate([
            littleLabelThree.topAnchor.constraint(equalTo: topLabelThree.bottomAnchor, constant: 32),
            littleLabelThree.leadingAnchor.constraint(equalTo: middleViewThree.leadingAnchor, constant: 16),
            littleLabelThree.trailingAnchor.constraint(equalTo: middleViewThree.trailingAnchor, constant: -16)
        ])
        
    }
    
    
    
    
    func codeTextFieldThreeLayout() {
        middleViewThree.addSubview(codeTextFieldThree)
        codeTextFieldThree.keyboardType = .numberPad
        
        NSLayoutConstraint.activate([
            codeTextFieldThree.topAnchor.constraint(equalTo: littleLabelThree.bottomAnchor, constant: 8),
            codeTextFieldThree.trailingAnchor.constraint(equalTo: middleViewThree.trailingAnchor, constant: -16),
            codeTextFieldThree.leadingAnchor.constraint(equalTo: middleViewThree.leadingAnchor, constant: 16),
            codeTextFieldThree.heightAnchor.constraint(equalToConstant: 54),
            
        ])
    }
    
    func codeTimeLeftLabelLayout() {
        middleViewThree.addSubview(codeTimeLeftLabel)
        codeTimeLeftLabel.translatesAutoresizingMaskIntoConstraints = false
        codeTimeLeftLabel.text = "Отправить код заново \(Int(timeInterval)) сек."
        codeTimeLeftLabel.textColor = .lightGray
        codeTimeLeftLabel.font = UIFont.systemFont(ofSize: 12)
        
        NSLayoutConstraint.activate([
            codeTimeLeftLabel.topAnchor.constraint(equalTo: codeTextFieldThree.bottomAnchor, constant: 8),
            codeTimeLeftLabel.leadingAnchor.constraint(equalTo: middleViewThree.leadingAnchor, constant: 16),
            
        ])
    }
    
    func takeCodeAgainLayout() {
        middleViewThree.addSubview(takeCodeAgain)
        takeCodeAgain.translatesAutoresizingMaskIntoConstraints = false
        takeCodeAgain.setTitle("Отправить заново", for: .normal)
        takeCodeAgain.setTitleColor(Colors.lightGreen, for: .disabled)
        takeCodeAgain.setTitleColor(Colors.mainColorGreen, for: .normal)
        takeCodeAgain.isEnabled = false
        takeCodeAgain.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        takeCodeAgain.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            takeCodeAgain.topAnchor.constraint(equalTo: codeTimeLeftLabel.bottomAnchor, constant: 14),
            takeCodeAgain.leadingAnchor.constraint(equalTo: middleViewThree.leadingAnchor, constant: 16),
            
        ])
        
        takeCodeAgain.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
        
    }
    
    func continueButtonThreeLayout() {
        middleViewThree.addSubview(continueButtonThree)
        
        NSLayoutConstraint.activate([
            continueButtonThree.topAnchor.constraint(equalTo: takeCodeAgain.bottomAnchor, constant: 24),
            continueButtonThree.leadingAnchor.constraint(equalTo: middleViewThree.leadingAnchor, constant: 16),
            continueButtonThree.trailingAnchor.constraint(equalTo: middleViewThree.trailingAnchor, constant: -16),
            continueButtonThree.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        continueButtonThree.addTarget(self, action: #selector(continueButtonThreeAction), for: .touchUpInside)
    }
    
    
    func backButtonThreeLayout() {
        middleViewThree.addSubview(backButtonThree)
        
        NSLayoutConstraint.activate([
            backButtonThree.topAnchor.constraint(equalTo: continueButtonThree.bottomAnchor, constant: 12),
            backButtonThree.leadingAnchor.constraint(equalTo: middleViewThree.leadingAnchor, constant: 16),
            backButtonThree.trailingAnchor.constraint(equalTo: middleViewThree.trailingAnchor, constant: -16),
            backButtonThree.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        backButtonThree.addTarget(self, action: #selector(backButtonThreeAction), for: .touchUpInside)
        backButtonThree.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
    }
}


// MARK: - Middle Items Four
private extension CreateAccountViewController {
    
    
    func middleItemsFour() {
        middleViewFourLayout()
        labelFourLayout()
        littleLabelFourLayout()
        createPasswordTextFieldLayout()
        repeatPasswordTextFieldLayout()
        continueButtonFourLayout()
        backButtonFourLayout()
    }
    
    
    func middleViewFourLayout() {
        
        view.addSubview(middleViewFour)
        middleViewFour.backgroundColor = .white
        middleViewFour.translatesAutoresizingMaskIntoConstraints = false
        middleViewFour.layer.cornerRadius = 20
        middleViewFour.isHidden = true
        
        
        NSLayoutConstraint.activate([
            middleViewFour.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 32),
            middleViewFour.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            middleViewFour.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            middleViewFour.heightAnchor.constraint(equalToConstant: 446)
        ])
        
    }
    
    
    func labelFourLayout() {
        middleViewFour.addSubview(topLabelFour)
        topLabelFour.translatesAutoresizingMaskIntoConstraints = false
        topLabelFour.text = "Создание аккаунта"
        topLabelFour.font = UIFont.boldSystemFont(ofSize: 24)
        
        NSLayoutConstraint.activate([
        
            topLabelFour.topAnchor.constraint(equalTo: middleViewFour.topAnchor, constant: 36),
            topLabelFour.leadingAnchor.constraint(equalTo: middleViewFour.leadingAnchor, constant: 16),
            topLabelFour.trailingAnchor.constraint(equalTo: middleViewFour.trailingAnchor, constant: -16),
        ])
    }
    
    
    func littleLabelFourLayout() {
        middleViewFour.addSubview(littleLabelFour)
        littleLabelFour.translatesAutoresizingMaskIntoConstraints =  false
        littleLabelFour.textColor = UIColor(red: 0.417, green: 0.431, blue: 0.438, alpha: 1)
        littleLabelFour.numberOfLines = 0
        littleLabelFour.lineBreakMode = .byWordWrapping
        littleLabelFour.text = "Придумайте пароль (минимум 6 латинских букв и 2 цифры)"
        
        NSLayoutConstraint.activate([
            littleLabelFour.topAnchor.constraint(equalTo: topLabelFour.bottomAnchor, constant: 32),
            littleLabelFour.leadingAnchor.constraint(equalTo: middleViewFour.leadingAnchor, constant: 16),
            littleLabelFour.trailingAnchor.constraint(equalTo: middleViewFour.trailingAnchor, constant: -16)
        ])
        
    }
    
    
    
    
    func createPasswordTextFieldLayout() {
        middleViewFour.addSubview(createPasswordTextField)
        createPasswordTextField.isSecureTextEntry = true
        
        NSLayoutConstraint.activate([
            createPasswordTextField.topAnchor.constraint(equalTo: littleLabelFour.bottomAnchor, constant: 8),
            createPasswordTextField.trailingAnchor.constraint(equalTo: middleViewFour.trailingAnchor, constant: -16),
            createPasswordTextField.leadingAnchor.constraint(equalTo: middleViewFour.leadingAnchor, constant: 16),
            createPasswordTextField.heightAnchor.constraint(equalToConstant: 54),
            
        ])
    }
    
    func repeatPasswordTextFieldLayout() {
        middleViewFour.addSubview(repeatPasswordTextField)
        repeatPasswordTextField.isSecureTextEntry = true
        
        NSLayoutConstraint.activate([
            repeatPasswordTextField.topAnchor.constraint(equalTo: createPasswordTextField.bottomAnchor, constant: 12),
            repeatPasswordTextField.trailingAnchor.constraint(equalTo: middleViewFour.trailingAnchor, constant: -16),
            repeatPasswordTextField.leadingAnchor.constraint(equalTo: middleViewFour.leadingAnchor, constant: 16),
            repeatPasswordTextField.heightAnchor.constraint(equalToConstant: 54),
            
        ])
    }
    
    func continueButtonFourLayout() {
        middleViewFour.addSubview(continueButtonFour)
        
        NSLayoutConstraint.activate([
            continueButtonFour.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: 24),
            continueButtonFour.leadingAnchor.constraint(equalTo: middleViewFour.leadingAnchor, constant: 16),
            continueButtonFour.trailingAnchor.constraint(equalTo: middleViewFour.trailingAnchor, constant: -16),
            continueButtonFour.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        continueButtonFour.addTarget(self, action: #selector(createPasswordAction), for: .touchUpInside)
        
    }
    
    
    func backButtonFourLayout() {
        middleViewFour.addSubview(backButtonFour)
        
        NSLayoutConstraint.activate([
            backButtonFour.topAnchor.constraint(equalTo: continueButtonFour.bottomAnchor, constant: 12),
            backButtonFour.leadingAnchor.constraint(equalTo: middleViewFour.leadingAnchor, constant: 16),
            backButtonFour.trailingAnchor.constraint(equalTo: middleViewFour.trailingAnchor, constant: -16),
            backButtonFour.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        backButtonFour.addTarget(self, action: #selector(backButtonFourAction), for: .touchUpInside)
        
    }
}



// MARK: - Middle Items Five (Person)
private extension CreateAccountViewController {
    
    
    func middleItemsFive() {
        middleViewFiveLayout()
        topLabelFiveLayout()
        
        firstNameTextFieldLayout()
        secondNameTextFieldLayout()
        
        dateOfBirsdayLabelLayout()
        dateOfBirsdayTextFieldLayout()
        
        sexLabelLayout()
        toggleSexViewLayout()
        menToggleButtonLayout()
        womenToggleButtonLayout()
        
        finishRegisteringButtonLayout()
        backButtonFiveLayout()
    }
    
    
    func middleViewFiveLayout() {
        
        view.addSubview(middleViewFive)
        middleViewFive.backgroundColor = .white
        middleViewFive.translatesAutoresizingMaskIntoConstraints = false
        middleViewFive.layer.cornerRadius = 20
        middleViewFive.isHidden = true
        
        
        NSLayoutConstraint.activate([
            middleViewFive.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 32),
            middleViewFive.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            middleViewFive.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            middleViewFive.heightAnchor.constraint(equalToConstant: 586)
        ])
        
    }
    
    
    func topLabelFiveLayout() {
        middleViewFive.addSubview(topLabelFive)
        topLabelFive.translatesAutoresizingMaskIntoConstraints = false
        topLabelFive.text = "Создание аккаунта"
        topLabelFive.font = UIFont.boldSystemFont(ofSize: 24)
        
        NSLayoutConstraint.activate([
        
            topLabelFive.topAnchor.constraint(equalTo: middleViewFive.topAnchor, constant: 36),
            topLabelFive.leadingAnchor.constraint(equalTo: middleViewFive.leadingAnchor, constant: 16),
            topLabelFive.trailingAnchor.constraint(equalTo: middleViewFive.trailingAnchor, constant: -16),
        ])
    }
    
    
    func firstNameTextFieldLayout() {
        middleViewFive.addSubview(firstNameTextField)
        
        NSLayoutConstraint.activate([
            firstNameTextField.topAnchor.constraint(equalTo: topLabelFive.bottomAnchor, constant: 32),
            firstNameTextField.trailingAnchor.constraint(equalTo: middleViewFive.trailingAnchor, constant: -16),
            firstNameTextField.leadingAnchor.constraint(equalTo: middleViewFive.leadingAnchor, constant: 16),
            firstNameTextField.heightAnchor.constraint(equalToConstant: 54),
            
        ])
    }
    
    func secondNameTextFieldLayout() {
        middleViewFive.addSubview(secondNameTextField)
        
        NSLayoutConstraint.activate([
            secondNameTextField.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 12),
            secondNameTextField.trailingAnchor.constraint(equalTo: middleViewFive.trailingAnchor, constant: -16),
            secondNameTextField.leadingAnchor.constraint(equalTo: middleViewFive.leadingAnchor, constant: 16),
            secondNameTextField.heightAnchor.constraint(equalToConstant: 54),
            
        ])
    }
    
    func dateOfBirsdayLabelLayout() {
        middleViewFive.addSubview(dateOfBirsdayLabel)
        dateOfBirsdayLabel.translatesAutoresizingMaskIntoConstraints = false
        dateOfBirsdayLabel.text = "Введите дату рождения"
        dateOfBirsdayLabel.font = UIFont.systemFont(ofSize: 14)
        dateOfBirsdayLabel.textColor = .systemGray
        
        NSLayoutConstraint.activate([
            dateOfBirsdayLabel.topAnchor.constraint(equalTo: secondNameTextField.bottomAnchor, constant: 12),
            dateOfBirsdayLabel.leadingAnchor.constraint(equalTo: middleViewFive.leadingAnchor, constant: 16),
            dateOfBirsdayLabel.trailingAnchor.constraint(equalTo: middleViewFive.trailingAnchor, constant: -16),
        ])
    }
    
    func dateOfBirsdayTextFieldLayout() {
        middleViewFive.addSubview(dateOfBirsdayTextField)
        
        NSLayoutConstraint.activate([
            dateOfBirsdayTextField.topAnchor.constraint(equalTo: dateOfBirsdayLabel.bottomAnchor, constant: 8),
            dateOfBirsdayTextField.trailingAnchor.constraint(equalTo: middleViewFive.trailingAnchor, constant: -16),
            dateOfBirsdayTextField.leadingAnchor.constraint(equalTo: middleViewFive.leadingAnchor, constant: 16),
            dateOfBirsdayTextField.heightAnchor.constraint(equalToConstant: 54),
            
        ])
    }
    
    func sexLabelLayout() {
        middleViewFive.addSubview(sexLabel)
        sexLabel.translatesAutoresizingMaskIntoConstraints = false
        sexLabel.text = "Выберите пол"
        sexLabel.font = UIFont.systemFont(ofSize: 14)
        sexLabel.textColor = .systemGray
        
        NSLayoutConstraint.activate([
        
            sexLabel.topAnchor.constraint(equalTo: dateOfBirsdayTextField.bottomAnchor, constant: 12),
            sexLabel.leadingAnchor.constraint(equalTo: middleViewFive.leadingAnchor, constant: 16),
            sexLabel.trailingAnchor.constraint(equalTo: middleViewFive.trailingAnchor, constant: -16),
        ])
    }
    
    
    func toggleSexViewLayout() {
        middleViewFive.addSubview(toggleSexView)
        toggleSexView.translatesAutoresizingMaskIntoConstraints = false
        toggleSexView.layer.borderWidth = 1
        toggleSexView.layer.borderColor = UIColor(red: 0.832, green: 0.862, blue: 0.871, alpha: 1).cgColor
        toggleSexView.layer.cornerRadius = 14
        
        NSLayoutConstraint.activate([
            toggleSexView.topAnchor.constraint(equalTo: sexLabel.bottomAnchor, constant: 8),
            toggleSexView.leadingAnchor.constraint(equalTo: middleViewFive.leadingAnchor, constant: 16),
            toggleSexView.trailingAnchor.constraint(equalTo: middleViewFive.trailingAnchor, constant: -16),
            toggleSexView.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
    
    func menToggleButtonLayout() {
        
        toggleSexView.addSubview(menToggleButton)
        menToggleButton.translatesAutoresizingMaskIntoConstraints = false
        menToggleButton.setTitle("Мужской", for: .normal)
        menToggleButton.backgroundColor = Colors.buttonGray
        menToggleButton.setTitleColor(.black, for: .normal)
        menToggleButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        menToggleButton.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            menToggleButton.topAnchor.constraint(equalTo: toggleSexView.topAnchor, constant: 4),
            menToggleButton.leadingAnchor.constraint(equalTo: toggleSexView.leadingAnchor, constant: 4),
            menToggleButton.trailingAnchor.constraint(equalTo: toggleSexView.centerXAnchor),
            menToggleButton.bottomAnchor.constraint(equalTo: toggleSexView.bottomAnchor, constant: -4)
        ])
        
        menToggleButton.addTarget(self, action: #selector(menToggleButtonAction), for: .touchUpInside)
        
    }
    
    func womenToggleButtonLayout() {
        
        toggleSexView.addSubview(womenToggleButton)
        womenToggleButton.translatesAutoresizingMaskIntoConstraints = false
        womenToggleButton.setTitle("Ищу сотрудников", for: .normal)
        womenToggleButton.backgroundColor = .clear
        womenToggleButton.setTitleColor(.lightGray, for: .normal)
        womenToggleButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        womenToggleButton.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            womenToggleButton.topAnchor.constraint(equalTo: toggleSexView.topAnchor, constant: 4),
            womenToggleButton.trailingAnchor.constraint(equalTo: toggleSexView.trailingAnchor, constant: -4),
            womenToggleButton.leadingAnchor.constraint(equalTo: toggleSexView.centerXAnchor),
            womenToggleButton.bottomAnchor.constraint(equalTo: toggleSexView.bottomAnchor, constant: -4)
        ])
        
        womenToggleButton.addTarget(self, action: #selector(womenToggleButtonAction), for: .touchUpInside)
        
    }
    
    
    func finishRegisteringButtonLayout() {
        middleViewFive.addSubview(personFinishRegisteringButton)
        
        NSLayoutConstraint.activate([
            personFinishRegisteringButton.topAnchor.constraint(equalTo: toggleSexView.bottomAnchor, constant: 24),
            personFinishRegisteringButton.leadingAnchor.constraint(equalTo: middleViewFive.leadingAnchor, constant: 16),
            personFinishRegisteringButton.trailingAnchor.constraint(equalTo: middleViewFive.trailingAnchor, constant: -16),
            personFinishRegisteringButton.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        personFinishRegisteringButton.addTarget(self, action: #selector(finishRegisteringButtonAction), for: .touchUpInside)
        
    }
    
    
    func backButtonFiveLayout() {
        middleViewFive.addSubview(backButtonFive)
        
        NSLayoutConstraint.activate([
            backButtonFive.topAnchor.constraint(equalTo: personFinishRegisteringButton.bottomAnchor, constant: 12),
            backButtonFive.leadingAnchor.constraint(equalTo: middleViewFive.leadingAnchor, constant: 16),
            backButtonFive.trailingAnchor.constraint(equalTo: middleViewFive.trailingAnchor, constant: -16),
            backButtonFive.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        backButtonFive.addTarget(self, action: #selector(backButtonFiveAction), for: .touchUpInside)
    }
}

//private let middleViewSix = UIView()
//private let topLabelSix = UILabel()
//
//private let companyNameLabel = UILabel()
//private let companyNameTextField = UITextField()
//
//private let innLabel = UILabel()
//private let innTextField = UITextField()
//
//
//private let companyFinishRegisteringButton = UIButton()
//private let backButtonSix = UIButton()

// MARK: - Middle Items Six (Company)
private extension CreateAccountViewController {
    
    
    func middleItemsSix() {
        middleViewSixLayout()
        topLabelSixLayout()
        
        companyNameLabelLayout()
        companyNameTextFieldLayout()
        
        innLabelLayout()
        innTextFieldLayout()
        
        companyFinishRegisteringButtonLayout()
        backButtonSixLayout()
    }
    
    
    func middleViewSixLayout() {
        
        view.addSubview(middleViewSix)
        middleViewSix.backgroundColor = .white
        middleViewSix.translatesAutoresizingMaskIntoConstraints = false
        middleViewSix.layer.cornerRadius = 20
        middleViewSix.isHidden = true
        
        
        NSLayoutConstraint.activate([
            middleViewSix.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 32),
            middleViewSix.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            middleViewSix.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            middleViewSix.heightAnchor.constraint(equalToConstant: 450)
        ])
        
    }
    
    
    func topLabelSixLayout() {
        middleViewSix.addSubview(topLabelSix)
        topLabelSix.translatesAutoresizingMaskIntoConstraints = false
        topLabelSix.text = "Создание аккаунта"
        topLabelSix.font = UIFont.boldSystemFont(ofSize: 24)
        
        NSLayoutConstraint.activate([
        
            topLabelSix.topAnchor.constraint(equalTo: middleViewSix.topAnchor, constant: 36),
            topLabelSix.leadingAnchor.constraint(equalTo: middleViewSix.leadingAnchor, constant: 16),
            topLabelSix.trailingAnchor.constraint(equalTo: middleViewSix.trailingAnchor, constant: -16),
        ])
    }
    
    
    func companyNameLabelLayout() {
        middleViewSix.addSubview(companyNameLabel)
        companyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        companyNameLabel.text = "Введите название компании"
        companyNameLabel.font = UIFont.systemFont(ofSize: 14)
        companyNameLabel.textColor = .systemGray
        
        NSLayoutConstraint.activate([
        
            companyNameLabel.topAnchor.constraint(equalTo: topLabelSix.bottomAnchor, constant: 32),
            companyNameLabel.leadingAnchor.constraint(equalTo: middleViewSix.leadingAnchor, constant: 16),
            companyNameLabel.trailingAnchor.constraint(equalTo: middleViewSix.trailingAnchor, constant: -16),
        ])
    }
    
    
    func companyNameTextFieldLayout() {
        middleViewSix.addSubview(companyNameTextField)
        
        NSLayoutConstraint.activate([
            companyNameTextField.topAnchor.constraint(equalTo: companyNameLabel.bottomAnchor, constant: 8),
            companyNameTextField.trailingAnchor.constraint(equalTo: middleViewSix.trailingAnchor, constant: -16),
            companyNameTextField.leadingAnchor.constraint(equalTo: middleViewSix.leadingAnchor, constant: 16),
            companyNameTextField.heightAnchor.constraint(equalToConstant: 54),
            
        ])
    }
    
    func innLabelLayout() {
        middleViewSix.addSubview(innLabel)
        innLabel.translatesAutoresizingMaskIntoConstraints = false
        innLabel.text = "Введите ИНН"
        innLabel.font = UIFont.systemFont(ofSize: 14)
        innLabel.textColor = .systemGray
        
        NSLayoutConstraint.activate([
        
            innLabel.topAnchor.constraint(equalTo: companyNameTextField.bottomAnchor, constant: 12),
            innLabel.leadingAnchor.constraint(equalTo: middleViewSix.leadingAnchor, constant: 16),
            innLabel.trailingAnchor.constraint(equalTo: middleViewSix.trailingAnchor, constant: -16),
        ])
    }
    
    
    func innTextFieldLayout() {
        middleViewSix.addSubview(innTextField)
        
        NSLayoutConstraint.activate([
            innTextField.topAnchor.constraint(equalTo: innLabel.bottomAnchor, constant: 8),
            innTextField.trailingAnchor.constraint(equalTo: middleViewSix.trailingAnchor, constant: -16),
            innTextField.leadingAnchor.constraint(equalTo: middleViewSix.leadingAnchor, constant: 16),
            innTextField.heightAnchor.constraint(equalToConstant: 54),
            
        ])
    }
    
    
    
    func companyFinishRegisteringButtonLayout() {
        middleViewSix.addSubview(companyFinishRegisteringButton)
        
        NSLayoutConstraint.activate([
            companyFinishRegisteringButton.topAnchor.constraint(equalTo: innTextField.bottomAnchor, constant: 24),
            companyFinishRegisteringButton.leadingAnchor.constraint(equalTo: middleViewSix.leadingAnchor, constant: 16),
            companyFinishRegisteringButton.trailingAnchor.constraint(equalTo: middleViewSix.trailingAnchor, constant: -16),
            companyFinishRegisteringButton.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        companyFinishRegisteringButton.addTarget(self, action: #selector(finishRegisteringButtonAction), for: .touchUpInside)
        
    }
    
    
    func backButtonSixLayout() {
        middleViewSix.addSubview(backButtonSix)
        
        NSLayoutConstraint.activate([
            backButtonSix.topAnchor.constraint(equalTo: companyFinishRegisteringButton.bottomAnchor, constant: 12),
            backButtonSix.leadingAnchor.constraint(equalTo: middleViewSix.leadingAnchor, constant: 16),
            backButtonSix.trailingAnchor.constraint(equalTo: middleViewSix.trailingAnchor, constant: -16),
            backButtonSix.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        backButtonSix.addTarget(self, action: #selector(backButtonSixAction), for: .touchUpInside)
    }
}

// MARK: - Buttons Action
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
        
        self.navigationController?.popViewController(animated: true)
    }
    
    // Continue to Enteryng Mail
    @objc func continueButtonAction() {
        middleView.isHidden = true
        middleViewTwo.isHidden = false
    }
    
    // Back to change person or company
    @objc func backButtonTwoAction() {
        middleView.isHidden = false
        middleViewTwo.isHidden = true
    }
    
    // Continue to entering code from email
    @objc func continueButtonTwoAction() {
        middleViewTwo.isHidden = true
        middleViewThree.isHidden = false
        
//        showMail()
          
    }
    
//    func showMail() {
//        if MFMailComposeViewController.canSendMail() {
//             let mail = MFMailComposeViewController()
//             mail.mailComposeDelegate = self
//             mail.setToRecipients(["mail"])
//             mail.setSubject("Any Subject")
//             mail.setMessageBody("You're so awesome!", isHTML: false)
//             present(mail, animated: true)
//        }else{
//            print("Application is not able to send an email")
//        }
//
//    }
    
    // Back to entering mail
    
    @objc func backButtonThreeAction() {
        middleViewTwo.isHidden = false
        middleViewThree.isHidden = true
        codeTextFieldThree.text = ""
    }
    
    
    // Continue to entering password
    @objc func continueButtonThreeAction() {
        if codeTextFieldThree.text == CodeRegister.code.codeRegister {
            codeTextFieldThree.text = ""
            middleViewThree.isHidden = true
            middleViewFour.isHidden = false
            
        }else {
            codeTextFieldThree.layer.borderColor = UIColor.systemRed.cgColor
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                
                self.codeTextFieldThree.layer.borderColor = UIColor.systemGray.cgColor
                
            }
        }
    }
    
    
    // Back from entering password to entering mail
    @objc func backButtonFourAction() {
        middleViewTwo.isHidden = false
        middleViewFour.isHidden = true
    }
    
    
    // Continue to Finish Account
    @objc func createPasswordAction() {
        if createPasswordTextField.text != repeatPasswordTextField.text {
            createPasswordTextField.layer.borderColor = UIColor.systemRed.cgColor
            repeatPasswordTextField.layer.borderColor = UIColor.systemRed.cgColor
            littleLabelFour.text = "Пароли не совпадают"
        }else {
            if isLeftActive {
                middleViewFive.isHidden = false
                middleViewFour.isHidden = true
            }else {
                middleViewSix.isHidden = false
                middleViewFour.isHidden = true
            }
        }
    }
    
    // Сhoice male gender
    @objc func menToggleButtonAction() {
        
        womenToggleButton.backgroundColor = .clear
        womenToggleButton.setTitleColor(.lightGray, for: .normal)
        menToggleButton.backgroundColor = Colors.buttonGray
        menToggleButton.setTitleColor(.black, for: .normal)
        isMenActive = true
    }
    
    // Сhoice female gender
    @objc func womenToggleButtonAction() {
        
        menToggleButton.backgroundColor = .clear
        menToggleButton.setTitleColor(.lightGray, for: .normal)
        womenToggleButton.backgroundColor = Colors.buttonGray
        womenToggleButton.setTitleColor(.black, for: .normal)
        isMenActive = false
    }
    
    // Finishing registration
    @objc func finishRegisteringButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    
    // Back to entering password from Person
    @objc func backButtonFiveAction() {
        middleViewFour.isHidden = false
        middleViewFive.isHidden = true
        createPasswordTextField.text = ""
        repeatPasswordTextField.text = ""
    }
    
    // Back to entering password from Company
    @objc func backButtonSixAction() {
        middleViewFour.isHidden = false
        middleViewSix.isHidden = true
        createPasswordTextField.text = ""
        repeatPasswordTextField.text = ""
    }
}

//extension CreateAccountViewController: MFMailComposeViewControllerDelegate {
//    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
//        if let _ = error {
//            controller.dismiss(animated: true)
//            return
//        }
//
//        switch result {
//        case .cancelled:
//            print("Cancelled")
//        case .failed:
//            print("Failed")
//        case .saved:
//            print("Saved")
//        case .sent:
//            print("Sent")
//        }
//
//        controller.dismiss(animated: true)
//    }
//}

// MARK: - Time Inteval of opportunity to send code one more time

private extension CreateAccountViewController {
    @objc func startTimer() {
        timeInterval = 5
        takeCodeAgain.isEnabled = false
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeTick), userInfo: nil, repeats: true)
        isTimerActive = true
        updateTimeLabel()
        
        
    
        
    }
    @objc func stopTimer() {
        takeCodeAgain.isEnabled = true
        isTimerActive = false
        timeInterval = 5
        updateTimeLabel()
        timer?.invalidate()
    }
    func updateTimeLabel() {
        
        codeTimeLeftLabel.text = "Отправить код заново \(Int(timeInterval)) сек."
        
    }
    
    @objc func timeTick() {
        
        timeInterval -= 1
        updateTimeLabel()
        
        if timeInterval == 0 {
            stopTimer()
            
            timeInterval = 0
            codeTimeLeftLabel.text = "Отправить код заново \(Int(timeInterval)) сек."
        }
        
        
    }
    
}



// MARK: - ViewModel Binding

private extension CreateAccountViewController {
    func binViewModel() {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: emailTextFieldTwo)
            .map { ($0.object as! UITextField).text ?? "" }
            .assign(to: \.email, on: viewModel)
            .store(in: &cancellables)
        
        viewModel.isValidEmailPublisher
            .assign(to: \.isEnabled, on: takeCodeButton)
            .store(in: &cancellables)
        
        
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: codeTextFieldThree)
            .map { ($0.object as! UITextField).text ?? "" }
            .assign(to: \.code, on: viewModel)
            .store(in: &cancellables)
        
        viewModel.isCodeInteredPublisher
            .assign(to: \.isCodeEntered, on: self)
            .store(in: &cancellables)
        
        viewModel.isCodeInteredPublisher
            .sink(receiveValue: {  _ in
                if self.isCodeEntered {
                    self.continueButtonThree.setTitle("Loading...", for: .normal)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.continueButtonThree.setTitle("Продолжить", for: .normal)
                        self.continueButtonThreeAction()
                    }
                    
                }
            })
            .store(in: &cancellables)
        
        
    }
}




