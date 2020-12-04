//
//  APIConstants.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import Foundation

enum URLConstants: String {
    case baseUrl = "https://pokeapi.co/api/v2/"
    case pokemons = "pokemon/"

}

enum QueryParamKey: String {

    case offset = "offset"
    case limit = "limit"
    
}

enum QueryParamValue: String {
    
    case limit = "20"
}
