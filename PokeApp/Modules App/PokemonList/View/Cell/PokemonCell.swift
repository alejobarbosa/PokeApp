//
//  PokemonCellTableViewCell.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import UIKit

class PokemonCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backView.layer.cornerRadius = 10
        self.backView.layoutSubviews()
    }

    func setData(name: String) {
        self.lblName.text = name
    }
    
}
