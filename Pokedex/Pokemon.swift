//
//  Pokemon.swift
//  Pokedex
//
//  Created by Niharika Sharma on 2017-07-20.
//  Copyright © 2017 Niharika Sharma. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon{
    
    private var _name: String!
    private var _pokedexId : Int!
    private var _description : String!
    private var _type : String!
    private var _defense : String!
    private var _height : String!
    private var _weight : String!
    private var _attack : String!
    private var _nextEvoTxt : String!
    private var _nextEvoId : String!
    private var _nxtEvo : String!
    private var pokemonURL : String!
    
    
    var nextEvo : String{
        get {
            if _nxtEvo == nil {
                _nxtEvo = ""
            }
            return _nxtEvo
        }
    }
    
    var nextEvotxt : String{
        get {
            if _nextEvoTxt == nil {
                _nextEvoTxt = ""
            }
            return _nextEvoTxt
        }
    }
    
    var nextEvoId : String{
        get {
            if _nextEvoId == nil {
                _nextEvoId = ""
            }
            return _nextEvoId
        }
    }
    
    
    var name : String{
        
        return _name
    }
    
    var description : String{
        get {
            if _description == nil {
                _description = ""
            }
            return _description
        }
    }
    var type : String{
        get {
            if _type == nil {
                _type = ""
            }
            return _type
        }
    }
    
    var defense : String{
        get {
            if _defense == nil {
                _defense = ""
            }
            return _defense
        }
    }
    
    var height : String{
        get {
            if _height == nil {
                _height = ""
            }
            return _height
        }
    }
    
    var weight : String{
        get {
            if _weight == nil {
                _weight = ""
            }
            return _weight
        }
    }
    var attack : String{
        get {
            if _attack == nil {
                _attack = ""
            }
            return _attack
        }
    }
    var pokedexId : Int{
        return _pokedexId
    }
    
    init(name : String, pokedexId : Int ){
        self._name = name
        self._pokedexId = pokedexId
        
        
    }
    
    func downloadPokemonDetails(completed: @escaping DownloadComplete){
        let url : String = "https://pokeapi.co/api/v1/pokemon/"
        Alamofire.request( URL(string: "\(url)\(self.pokedexId)")!, method: .get,
                           parameters: ["include_docs": "true"])
            .validate()
            .responseJSON { (response) -> Void in
                
                let result = response.result
                if let dict = result.value as? Dictionary<String, AnyObject> {
                    if let weight = dict["weight"] as? String{
                        self._weight = weight
                    }
                    if let height = dict["height"] as? String{
                        self._height = height
                    }
                    if let attack = dict["attack"] as? Int{
                        self._attack = "\(attack)"
                    }
                    if let defense = dict["defense"] as? Int{
                        self._defense = "\(defense)"
                    }
                    
                    
                    if let types = dict["types"] as? [Dictionary<String,String>], types.count > 0 {
                        if let name = types[0]["name"] {
                            self._type = name.capitalized
                        }
                        if types.count > 1 {
                            for x in 1 ..< types.count {
                                if let name = types[x]["name"] {
                                    self._type! += "/\(name.capitalized)"
                                }
                                
                            }
                        }else {
                            self._type = ""
                            
                        }
                    }
                    print(self._weight)
                    print(self._height)
                    print(self._attack)
                    print(self._defense)
                    print(self._type)
                    
                    if let descArr = dict["descriptions"] as? [Dictionary<String,String>], descArr.count > 0 {
                        let url1 : String = "https://pokeapi.co"
                        if let urz = descArr[0]["resource_uri"]
                        {
                            Alamofire.request( URL(string: "\(url1)\(urz)")!, method: .get,
                                               parameters: ["include_docs": "true"])
                                .validate()
                                .responseJSON { (response) -> Void in
                                    
                                    let result = response.result
                                    if let descDict = result.value as? Dictionary<String, AnyObject>{
                                        if let description = descDict["description"] as? String{
                                            self._description = description
                                            print(self._description)
                                            completed()
                                        }
                                    }
                            }
                            
                        }
                    }else {
                        
                        self._description = ""
                    }
                }
        }
    }
}
