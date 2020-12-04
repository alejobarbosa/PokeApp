//
//  PokemonDetailVC.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import UIKit

class PokemonDetailVC: UIViewController {

    @IBOutlet weak var viewContentSuper: UIView!
    @IBOutlet weak var imgPokemon: UIImageView!
    @IBOutlet weak var viewPokedexNumber: UIView!
    @IBOutlet weak var lblPokedexNumber: UILabel!
    @IBOutlet weak var lblPokemonName: UILabel!
    @IBOutlet weak var viewContentData: UIView!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblMoves: UILabel!
    var pokemonDescription: PokemonDescriptionDecodable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpViews()
        self.setData()
    }

    private func setUpViews(){
        viewContentSuper.layer.cornerRadius = 10
        viewPokedexNumber.layer.cornerRadius = 10
        viewContentData.layer.cornerRadius = 10
    }
    
    private func setData(){
        setImage(urlString: self.pokemonDescription.sprites.other.official_artwork.front_default)
        lblPokedexNumber.text = self.pokemonDescription.id.description
        lblPokemonName.text = self.pokemonDescription.name
        lblHeight.text = self.pokemonDescription.height.description
        lblWeight.text = self.pokemonDescription.weight.description
        var types = ""
        for type in self.pokemonDescription.types {
            types.append("\(type.type.name.uppercased())\(", ")")
        }
        types.removeLast(2)
        lblType.text = types
        var moves = ""
        for (index, move) in self.pokemonDescription.moves.enumerated() {
            if index < 5 {
                moves.append("\(move.move.name.uppercased())\(", ")")
            }
        }
        moves.removeLast(2)
        lblMoves.text = moves
    }
    
    private func setImage(urlString: String) {
        let url: URL = URL(string: urlString)!
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            if data != nil {
                let image = UIImage(data: data!)
                if image != nil {
                    DispatchQueue.main.async {
                        let cache = NSCache<NSString, UIImage>()
                        var myObject = image
                        
                        if let cachedVersion = cache.object(forKey: urlString as NSString) {
                            myObject = cachedVersion
                        } else {
                            myObject = UIImage()
                            cache.setObject(myObject!, forKey: urlString as NSString)
                        }
                        self.imgPokemon.image = image
                    }
                }
            }
        })
        task.resume()
    }

    @IBAction func onBackClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onUserClick(_ sender: Any) {
        
    }
}
