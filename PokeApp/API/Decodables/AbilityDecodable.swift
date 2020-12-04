//
//  AbilitieDecodable.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import Foundation

class AbilityDecodable: Decodable {
    
    var ability: ResultDecodable
    var is_hidden: Bool
    var slot: Int
    
    private enum CodingKeys: String, CodingKey {
        case ability
        case is_hidden
        case slot
    }
    
}
