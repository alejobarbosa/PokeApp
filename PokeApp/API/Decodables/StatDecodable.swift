//
//  StatDecodable.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import Foundation
class StatDecodable: Decodable {
 
    var base_stat: Int
    var effort: Int
    var stat: ResultDecodable
    
    private enum CodingKeys: String, CodingKey {
        case base_stat
        case effort
        case stat
    }
}
