//
//  TextsApp.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import Foundation

enum TextsApp: String {
    
    //MARK: initial view
    
    //MARK: alerts
    case cancel = "Cancel"
    case accept = "Accept"
    
    //MARK: constants
    case baseURL = "Base Url"
    case png = ".png"
    
    //MARK: errors
    case withoutInternetTitle = "Without connection"
    case withoutInternetMessage = "Please, review your connection to internet"
    case errorWithDownloadTitle = "Something wrong happened"
    case errorWithDownloadMessage = "Your request cann't be processed, try again"
    case pokemonNotFoundTitle = "Pokemon not found"
    case pokemonNotFoundMessage = "The Pokemon you are requesting cannot be found"
    
    //MARK: objects in the app
    case progressView = "ProgressView"
    case pokemonCell = "PokemonCell"
    case infoCell = "InfoCell"
    case searchBarView = "SearchBarView"
    
}
