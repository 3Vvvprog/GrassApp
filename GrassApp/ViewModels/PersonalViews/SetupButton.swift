//
//  SetupButton.swift
//  GrassApp
//
//  Created by Вячеслав Вовк on 24.09.2023.
//

import Foundation
import UIKit


enum TypeButton {
    case green, white
}

final class SetupButton: UIButton {
    init(text: String, typeButton: TypeButton) {
        super.init(frame: .zero)
        setupButton(text: text, typeButton: typeButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton(text: String, typeButton: TypeButton) {
        
        if typeButton == .green {
            backgroundColor = Colors.mainColorGreen
            setTitle(text, for: .normal)
            translatesAutoresizingMaskIntoConstraints = false
            setTitleColor(.white, for: .normal)
            titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            layer.cornerRadius = 14
        }else {
            backgroundColor = .white
            setTitle(text, for: .normal)
            translatesAutoresizingMaskIntoConstraints = false
            setTitleColor(Colors.mainColorGreen, for: .normal)
            titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
            layer.cornerRadius = 14
            layer.borderColor = Colors.mainColorGreen.cgColor
            layer.borderWidth = 1
        }
    }
}
