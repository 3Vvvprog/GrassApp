//
//  CodeRegister.swift
//  GrassApp
//
//  Created by Вячеслав Вовк on 23.09.2023.
//

import Foundation


struct CodeRegister {
    let codeRegister: String?
}

extension CodeRegister {
    static var code = CodeRegister(codeRegister: "1234")
}
