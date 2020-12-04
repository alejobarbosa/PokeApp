//
//  VersionDetailDecodable.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import Foundation

class VersionDetailDecodable: Decodable {
    
    var rarity: Int
    var version: ResultDecodable
    
    private enum CodingKeys: String, CodingKey {
        case rarity
        case version
    }
}
