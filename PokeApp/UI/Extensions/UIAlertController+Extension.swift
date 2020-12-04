//
//  UIAlertController+Extension.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import UIKit

extension UIAlertController {
    
    func createAction(title: String, handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
        let action = UIAlertAction(title: title, style: .default, handler: handler)
        return action
    }
}
