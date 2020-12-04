//
//  PokemonDetailModel.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import Foundation

class PokemonDetailModel: BaseModel {
    private var view: PokemonDetailViewProtocol
    
    init(view: PokemonDetailViewProtocol) {
        self.view = view
        super.init(view: view)
    }
    
}

// MARK: ModelProtocol
extension PokemonDetailModel: PokemonDetailModelProtocol {
    
}
