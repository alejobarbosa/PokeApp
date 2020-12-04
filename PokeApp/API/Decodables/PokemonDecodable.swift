//
//  PokemonDecodable.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import Foundation

class PokemonDecodable: Decodable {
    
    var count: Int
    var next: String?
    var previous: String?
    var results: [ResultDecodable]
    
    private enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case results
    }
    
}
