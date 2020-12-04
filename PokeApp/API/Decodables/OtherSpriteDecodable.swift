//
//  OtherSpriteDecodable.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import Foundation

class OtherSpriteDecodable: Decodable {
    
    var dream_world: OtherDecodable
    var official_artwork: OtherDecodable
    
    private enum CodingKeys: String, CodingKey {
        case dream_world
        case official_artwork = "official-artwork"
    }
}
