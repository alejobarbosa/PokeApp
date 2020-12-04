//
//  PokemonListPresenter.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import Foundation

protocol PokemonListViewProtocol: BaseViewProtocol {
    func onSuccessPokemon(pokemon: PokemonDecodable)
    func onFailurePokemon(title: String, message: String)
    func onSuccessPokemonData(_ pokemonData: PokemonDescriptionDecodable)
    func onFailurePokemonData()
}

protocol PokemonListModelProtocol: BaseModelProtocol {
    func onSuccessPokemon(pokemon: PokemonDecodable)
    func onFailurePokemon(title: String, message: String)
    func onSuccessPokemonData(_ pokemonData: PokemonDescriptionDecodable)
    func onFailurePokemonData()
}
