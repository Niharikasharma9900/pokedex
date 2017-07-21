//
//  PokeCollectionViewCell.swift
//  Pokedex
//
//  Created by Niharika Sharma on 2017-07-20.
//  Copyright © 2017 Niharika Sharma. All rights reserved.
//

import UIKit

class PokeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var pokeImage : UIImageView!
    @IBOutlet weak var namelbl : UILabel!
    
    var pokemon : Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    func configureCell (pokemon : Pokemon){
    self.pokemon = pokemon
        namelbl.text = self.pokemon.name.capitalized
        pokeImage.image = UIImage(named: "\(self.pokemon.pokedexId)")
    
    
    }
}
