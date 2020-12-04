//
//  TypeDecodable.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import Foundation

class TypeDecodable: Decodable {
    
    var slot: Int
    var type: ResultDecodable
    
    private enum CodingKeys: String, CodingKey {
        case slot
        case type
    }
}
