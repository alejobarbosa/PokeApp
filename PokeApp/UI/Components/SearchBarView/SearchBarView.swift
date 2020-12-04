//
//  SearchBarView.swift
//  PokeApp
//
//  Created by Alejandro Barbosa on 3/12/20.
//

import UIKit

protocol SearchBarViewDelegate {
    func onSearchClick(text: String)
}

class SearchBarView: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var tfSearch: UITextField!
    @IBOutlet weak var btSearch: UIButton!
    fileprivate let deviceSize = UIScreen.main.bounds.size
    fileprivate var delegate: SearchBarViewDelegate!
    
    init(delegate: SearchBarViewDelegate) {
        let frame = CGRect(x: 0, y: 0, width: deviceSize.width, height: 70)
        super.init(frame: frame)
        Bundle.main.loadNibNamed(TextsApp.searchBarView.rawValue, owner: self, options: nil)
        self.delegate = delegate
        self.tfSearch.isEnabled = false
        self.viewMain.layer.cornerRadius = 10
        self.btSearch.layer.cornerRadius = 10
        self.view!.frame = frame
        self.addSubview(self.view!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func onSearchClick(_ sender: Any) {
        self.delegate.onSearchClick(text: self.tfSearch.text ?? "")
    }
    
}
