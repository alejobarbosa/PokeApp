//
//  OtherDecodable.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import Foundation

class OtherDecodable: Decodable {
    
    var front_default: String
    
    private enum CodingKeys: String, CodingKey {
        case front_default
    }
}
