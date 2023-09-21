//
//  ViewModel.swift
//  Music
//
//  Created by Вячеслав Вовк on 15.09.2023.
//

import Foundation
import Combine
import UIKit

enum ViewStates {
    case loading, success, failed, none
}




class ViewModel {
    
    @Published var email = ""
    @Published var password = ""
    @Published var color: UIColor = Colors.lightGreen
    @Published var state: ViewStates = .none
    
    var isValidEmailPublisher: AnyPublisher<Bool, Never> {
        $email
            .map { $0.isEmail() }
            .eraseToAnyPublisher()
    }
    
    var isValidPasswordPublisher: AnyPublisher<Bool, Never> {
        $password
            .map { !$0.isEmpty }
            .eraseToAnyPublisher()
    }
    
    
    
    var isLoginEnabled: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(isValidEmailPublisher, isValidPasswordPublisher)
            .map { $0 && $1 }
            .eraseToAnyPublisher()
        
    }
    
    func submitLogin() {
        state = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) { [weak self] in
            guard let self = self else { return }
            
            if self.isCorrectLogin() {
                self.state = .success
            }else {
                self.state = .failed
            }
        }
        
    }
    
    func isCorrectLogin() -> Bool {
        return email == "Test@mail.ru" && password == "123"
    }
    
}
