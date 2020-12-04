//
//  APIClient.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import Foundation
import Alamofire

class APIClient {
    
    static func validateConnectInternet() -> Bool {
        if let network = NetworkReachabilityManager() {
            return network.isReachable
        }
        return false
    }
    
    // MARK: Services app
    static func getPokemonList(offset: String, count: Int = 0, completion: ((PokemonDecodable?, String?)->Void)? = nil) {
        if count < 3 {
            AF.request(APIRouter.getPokemonList(offset: offset) as URLRequestConvertible)
                .logRequest()
                .responseJSON { (response) in
                        switch response.result {
                        case .success:
                            if let json = response.value, let data = response.data {
                                print("Success JSON getPokemonList: \(json)")
                                do {
                                    let pokemonDecodable = try JSONDecoder().decode(PokemonDecodable.self, from: data)
                                    completion!(pokemonDecodable, nil)
                                } catch {
                                    print("Error Decodable getPokemonList: \(error)")
                                    completion!(nil, nil)
                                }
                            }
                        case .failure(let error):
                            print("Failure getPokemonList: \(error)")
                            completion!(nil, nil)
                        }
                }
        } else {
            completion!(nil, nil)
        }
    }
    
    static func getPokemonData(name: String, count: Int = 0, completion: ((PokemonDescriptionDecodable?)->Void)? = nil) {
        if count < 3 {
            AF.request(APIRouter.getPokemonData(name: name) as URLRequestConvertible)
                .logRequest()
                .responseJSON { (response) in
                        switch response.result {
                        case .success:
                            if let json = response.value, let data = response.data {
                                print("Success JSON getPokemonData: \(json)")
                                do {
                                    let pokemonDataDecodable = try JSONDecoder().decode(PokemonDescriptionDecodable.self, from: data)
                                    completion!(pokemonDataDecodable)
                                } catch {
                                    print("Error Decodable getPokemonData: \(error)")
                                    completion!(nil)
                                }
                            }
                        case .failure(let error):
                            print("Failure getPokemonData: \(error)")
                            completion!(nil)
                        }
                }
        } else {
            completion!(nil)
        }
    }
    
}

extension DataRequest {
    public func logRequest() -> Self {
        self.responseData { response in
            print(response.debugDescription)
        }
        return self
    }
}
