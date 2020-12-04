//
//  PokemonListVC.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import UIKit

class PokemonListVC: BaseVC {

    @IBOutlet weak var tvPokemon: UITableView!
    
    private lazy var presenter = PokemonListModel(view: self)
    private var pokemonList = [ResultDecodable]()
    private var count = 0
    private var totalPokemon = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        tvPokemon.delegate = self
        tvPokemon.dataSource = self
        tvPokemon.separatorStyle = .none
        let nib1 = UINib(nibName: TextsApp.infoCell.rawValue, bundle: nil)
        tvPokemon.register(nib1, forCellReuseIdentifier: TextsApp.infoCell.rawValue)
        let nib2 = UINib(nibName: TextsApp.pokemonCell.rawValue, bundle: nil)
        tvPokemon.register(nib2, forCellReuseIdentifier: TextsApp.pokemonCell.rawValue)
        showProgress()
        presenter.getPokemonList(offset: count.description)
    }
    
    func backToPreviousState() {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func onBackClick(_ sender: Any) {
        self.backToPreviousState()
    }
    
    @IBAction func onUserClick(_ sender: Any) {
        
    }
    
}

extension PokemonListVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return pokemonList.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 120
        default:
            return 56
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 70
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.deviceSize.width, height: 70))
        let searchBarView = SearchBarView(delegate: self)
        view.addSubview(searchBarView)
        return section == 0 ? nil : view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return tvPokemon.dequeueReusableCell(withIdentifier: TextsApp.infoCell.rawValue)!
        } else {
            let cell = tvPokemon.dequeueReusableCell(withIdentifier: TextsApp.pokemonCell.rawValue) as! PokemonCell
            cell.setData(name: pokemonList[indexPath.row].name)
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            showProgress()
            self.presenter.getPokemonData(name: self.pokemonList[indexPath.row].name)
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        // UITableView only moves in one direction, y axis
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        if maximumOffset - currentOffset <= 10.0 {
            print("Load more")
            if self.count <= totalPokemon - (Int(QueryParamValue.limit.rawValue) ?? 0) {
                self.showProgress()
                self.presenter.getPokemonList(offset: self.count.description)
            }
        }
    }
}

extension PokemonListVC: SearchBarViewDelegate {
    
    func onSearchClick(text: String) {
        
    }
    
}

extension PokemonListVC: PokemonListViewProtocol {
    
    func onSuccessPokemon(pokemon: PokemonDecodable) {
        self.totalPokemon = pokemon.count
        self.count += 20
        for pok in pokemon.results {
            self.pokemonList.append(pok)
        }
        self.tvPokemon.reloadData()
        self.hideProgress()
    }
    
    func onFailurePokemon(title: String, message: String) {
        hideProgress()
        var alert: UIAlertController
        alert = createAlertView(title: title, message: message, hasCancelButton: false,  handlerAccept: { _ in
            self.backToPreviousState()
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    func onSuccessPokemonData(_ pokemonData: PokemonDescriptionDecodable) {
        hideProgress()
        let pokemonDetailVC = PokemonDetailVC()
        pokemonDetailVC.pokemonDescription = pokemonData
        self.navigationController?.pushViewController(pokemonDetailVC, animated: true)
    }
    
    func onFailurePokemonData() {
        hideProgress()
        var alert: UIAlertController
        alert = createAlertView(title: TextsApp.pokemonNotFoundTitle.rawValue, message: TextsApp.pokemonNotFoundMessage.rawValue, hasCancelButton: false)
        self.present(alert, animated: true, completion: nil)
    }
    
}

