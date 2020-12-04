//
//  PokemonDescriptionDecodable.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import Foundation

class PokemonDescriptionDecodable: Decodable {
    
    var abilities: [AbilityDecodable]
    var base_experience: Int
    var forms: [ResultDecodable]
    var game_indices: [GameIndiceDecodable]
    var height: Int
    var held_items: [HeldItemDecodable]
    var id: Int
    var is_default: Bool
    var location_area_encounters: String
    var moves: [MoveDecodable]
    var name: String
    var order: Int
    var species: ResultDecodable
    var sprites: SpritesDecodable
    var stats: [StatDecodable]
    var types: [TypeDecodable]
    var weight: Int
    
    private enum CodingKeys: String, CodingKey {
        case abilities
        case base_experience
        case forms
        case game_indices
        case height
        case held_items
        case id
        case is_default
        case location_area_encounters
        case moves
        case name
        case order
        case species
        case sprites
        case stats
        case types
        case weight
    }
    
}
