//
//  ResultDecodable.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import Foundation

class ResultDecodable: Decodable {
    
    var name: String
    var url: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}
