//
//  PokemonDetailVCViewController.swift
//  Pokedex
//
//  Created by Niharika Sharma on 2017-07-24.
//  Copyright © 2017 Niharika Sharma. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    var pokemon : Pokemon!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var defenceLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var pokemonId: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var baseAttackLabel: UILabel!
    
    @IBOutlet weak var CurrentEvoImage: UIImageView!
    
    @IBOutlet weak var NextEvoImage: UIImageView!
    
    @IBOutlet weak var EvoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = pokemon.name
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImage.image = img
        CurrentEvoImage.image = img
        
        pokemon.downloadPokemonDetails {
            self.updateUI()
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    func updateUI(){
        descriptionLabel.text = pokemon.description
        typeLabel.text = pokemon.type
        defenceLabel.text = pokemon.defense
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        baseAttackLabel.text = pokemon.attack
        pokemonId.text = "\(pokemon.pokedexId)"
        if pokemon.nextEvoId.characters.count <= 0 {
            EvoLabel.text = "No Evolution"
            NextEvoImage.isHidden = true
        }else {
            NextEvoImage.isHidden = false
            NextEvoImage.image = UIImage(named: pokemon.nextEvoId)
            var str = "Next Evolution: \(pokemon.nextEvotxt)"
            if pokemon.nextEvo == "" {
                str += "-LVL \(pokemon.nextEvo)"
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
