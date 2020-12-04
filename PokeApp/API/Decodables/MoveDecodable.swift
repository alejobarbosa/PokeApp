//
//  MoveDecodable.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import Foundation

class MoveDecodable: Decodable {
    
    var move: ResultDecodable
    var version_group_details: [VersionGroupDetailDecodable]
    
    private enum CodingKeys: String, CodingKey {
        case move
        case version_group_details
    }
    
}
