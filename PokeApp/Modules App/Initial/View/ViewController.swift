//
//  ViewController.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import UIKit

class ViewController: BaseVC {

    @IBOutlet weak var pokemonYPosition: NSLayoutConstraint!
    @IBOutlet weak var welcomeYPosition: NSLayoutConstraint!
    @IBOutlet weak var knowYPosition: NSLayoutConstraint!
    @IBOutlet weak var viewYPosition: NSLayoutConstraint!
    @IBOutlet weak var pikachuXPosition: NSLayoutConstraint!
    @IBOutlet weak var btYPosition: NSLayoutConstraint!
    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var btStart: UIButton!
    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var lblKnow: UILabel!
    @IBOutlet weak var btNext: UIButton!
    @IBOutlet weak var iconNext: UIImageView!
    @IBOutlet weak var imagePikachu: UIImageView!
    private var isFirstTime = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btStart.layer.cornerRadius = 10
        detailsView.layer.borderWidth = 2
        detailsView.layer.borderColor = UIColor.white.cgColor
        detailsView.layer.cornerRadius = 5
        self.view.layoutSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isFirstTime {
            UIView.animate(withDuration: 0.6,
                           delay: 0,
                           options: .curveEaseOut,
                           animations: {
                            self.pokemonYPosition.constant -= self.deviceSize.height * 0.35
                            self.lblWelcome.alpha = 1
                            self.welcomeYPosition.constant -= self.deviceSize.height * 0.2
                            self.lblKnow.alpha = 1
                            self.knowYPosition.constant -= self.deviceSize.height * 0.15
                            self.detailsView.alpha = 1
                            self.viewYPosition.constant -= self.deviceSize.height * 0.1
                            self.imagePikachu.alpha = 1
                            self.pikachuXPosition.constant -= self.deviceSize.width * 0.4
                            self.btNext.isHidden = false
                            self.btNext.alpha = 1
                            self.iconNext.alpha = 1
                            self.btYPosition.constant -= self.deviceSize.height * 0.1
                            self.view.layoutIfNeeded()
            }, completion: {(finished:Bool) in
                self.isFirstTime = false
            })
        }
    }
    
    @IBAction func onStartClick(_ sender: Any) {
        self.navigationController?.pushViewController(PokemonListVC(), animated: true)
    }
    
}

