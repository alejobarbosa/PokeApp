//
//  SpritesDecodable.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import Foundation

class SpritesDecodable: Decodable {
    
    var back_default: String?
    var back_female: String?
    var back_shiny: String?
    var back_shiny_female: String?
    var front_default: String?
    var front_female: String?
    var front_shiny: String?
    var front_shiny_female: String?
    var other: OtherSpriteDecodable
    
    private enum CodingKeys: String, CodingKey {
        case back_default
        case back_female
        case back_shiny
        case back_shiny_female
        case front_default
        case front_female
        case front_shiny
        case front_shiny_female
        case other
    }
}
