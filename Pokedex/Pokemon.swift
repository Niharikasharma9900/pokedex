//
//  Pokemon.swift
//  Pokedex
//
//  Created by Niharika Sharma on 2017-07-20.
//  Copyright © 2017 Niharika Sharma. All rights reserved.
//

import Foundation

class Pokemon{

    private var _name: String!
    private var _pokedexId : Int!
    
    var name : String{
    
    return _name
    }
  
    var pokedexId : Int{
    return _pokedexId
    }

    init(name : String, pokedexId : Int ){
        self._name = name
        self._pokedexId = pokedexId
    }
}
