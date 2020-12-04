//
//  VersionGroupDetailDecodable.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import Foundation

class VersionGroupDetailDecodable: Decodable {
    
    var level_learned_at: Int
    var move_learn_method: ResultDecodable
    var version_group: ResultDecodable
    
    private enum CodingKeys: String, CodingKey {
        case level_learned_at
        case move_learn_method
        case version_group
    }
}
