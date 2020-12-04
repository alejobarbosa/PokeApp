//
//  GameIndiceDecodable.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import Foundation

class GameIndiceDecodable: Decodable {
 
    var game_index: Int
    var version: ResultDecodable
    
    private enum CodingKeys: String, CodingKey {
        case game_index
        case version
    }
    
}
