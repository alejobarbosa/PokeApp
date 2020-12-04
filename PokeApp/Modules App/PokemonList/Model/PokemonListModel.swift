//
//  PokemonListModel.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import Foundation

class PokemonListModel: BaseModel {
    private var view: PokemonListViewProtocol
    
    init(view: PokemonListViewProtocol) {
        self.view = view
        super.init(view: view)
    }
    
    func getPokemonList(offset: String) {
        if APIClient.validateConnectInternet() {
            APIClient.getPokemonList(offset: offset) { (pokemonDecodable, msg) in
                if let pokemon = pokemonDecodable {
                    self.onSuccessPokemon(pokemon: pokemon)
                } else if let message = msg {
                    self.onFailurePokemon(title: TextsApp.errorWithDownloadTitle.rawValue, message: message)
                } else {
                    self.onFailurePokemon(title: TextsApp.errorWithDownloadTitle.rawValue, message: TextsApp.errorWithDownloadMessage.rawValue)
                }
            }
        } else {
            self.onFailurePokemon(title: TextsApp.withoutInternetTitle.rawValue, message: TextsApp.withoutInternetMessage.rawValue)
        }
    }
    
    func getPokemonData(name: String) {
        if APIClient.validateConnectInternet() {
            APIClient.getPokemonData(name: name) { (pokemonDataDecodable) in
                if let pokemonData = pokemonDataDecodable {
                    self.onSuccessPokemonData(pokemonData)
                } else {
                    self.onFailurePokemonData()
                }
            }
        } else {
            self.onFailurePokemon(title: TextsApp.withoutInternetTitle.rawValue, message: TextsApp.withoutInternetMessage.rawValue)
        }
    }
    
}

// MARK: ModelProtocol
extension PokemonListModel: PokemonListModelProtocol {
    
    func onSuccessPokemon(pokemon: PokemonDecodable) {
        self.view.onSuccessPokemon(pokemon: pokemon)
    }
    
    func onFailurePokemon(title:String, message: String) {
        self.view.onFailurePokemon(title: title, message: message)
    }
    
    func onSuccessPokemonData(_ pokemonData: PokemonDescriptionDecodable) {
        self.view.onSuccessPokemonData(pokemonData)
    }
    
    func onFailurePokemonData() {
        self.view.onFailurePokemonData()
    }
}
