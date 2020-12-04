//
//  APIRouter.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    //MARK: services of app
    case getPokemonList(offset: String)
    case getPokemonData(name: String)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .getPokemonList, .getPokemonData:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .getPokemonList:
            return URLConstants.pokemons.rawValue
        case .getPokemonData(let name):
            return URLConstants.pokemons.rawValue + name
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .getPokemonList(let offset):
            return [QueryParamKey.offset.rawValue : offset,
                    QueryParamKey.limit.rawValue : QueryParamValue.limit.rawValue]
        default:
            return nil
        }
    }
    
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        var url: URL
        var urlRequest: URLRequest
        
        url = try URLConstants.baseUrl.rawValue.asURL()
        
        urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        if let parameters = parameters {
            return try URLEncoding.queryString.encode(urlRequest, with: parameters)
        }
        return urlRequest
    }
    
    
}
