//
//  HeldItemDecodable.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import Foundation

class HeldItemDecodable: Decodable {
     
    var item: ResultDecodable
    var version_details: [VersionDetailDecodable]
    
    private enum CodingKeys: String, CodingKey {
        case item
        case version_details
    }
}
