//
//  ComponentViewDelegate.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import UIKit

protocol ComponentViewDelegate {
    func add(view: UIView, isProgressView: Bool)
    
    func center(view: UIView)
    
    func bottom(view: UIView)
}
