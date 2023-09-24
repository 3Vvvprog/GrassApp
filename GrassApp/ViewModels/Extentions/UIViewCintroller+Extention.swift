//
//  UIViewCintroller+Extention.swift
//  GrassApp
//
//  Created by Вячеслав Вовк on 24.09.2023.
//

import Foundation
import UIKit

extension UIViewController {
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
