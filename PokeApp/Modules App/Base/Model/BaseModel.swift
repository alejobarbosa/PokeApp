//
//  BaseModel.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import Foundation

class BaseModel {
    
    private var view: BaseViewProtocol
    
    init(view: BaseViewProtocol) {
        self.view = view
    }
}

extension BaseModel: BaseModelProtocol {
}
