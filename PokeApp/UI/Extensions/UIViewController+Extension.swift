//
//  UIViewController+Extension.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import UIKit

extension UIViewController {
    
    func createAlertView(title: String,
                         message: String,
                         hasCancelButton: Bool,
                         handlerAccept: ((UIAlertAction) -> Void)? = nil,
                         handlerCancel: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if hasCancelButton {
            alert.addAction(alert.createAction(title: TextsApp.cancel.rawValue, handler: handlerCancel))
        }
        alert.addAction(alert.createAction(title: TextsApp.accept.rawValue, handler: handlerAccept))
        
        return alert
    }
}
