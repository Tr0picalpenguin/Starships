//
//  Starship.swift
//  Starships
//
//  Created by Scott Cox on 5/24/22.
//

import Foundation

class Starship {
    
    // MARK: - Private Keys
    private let kName = "name"
    private let kModel = "model"
    private let kCrew = "crew"
    private let kStarshipClass = "starship_class"
    
    let name: String
    let model: String
    let crew: String
    let starshipClass: String
    
    init(name: String, model: String, crew: String, starshipClass: String) {
        
        self.name = name
        self.model = model
        self.crew = crew
        self.starshipClass = starshipClass
    }
    
    // Failable init
    init?(starshipDictionary: [String:Any]) {
        guard let name = starshipDictionary[kName] as? String,
        let model = starshipDictionary[kModel] as? String,
        let crew = starshipDictionary[kCrew] as? String,
        let starshipClass = starshipDictionary[kStarshipClass] as? String
        else {return nil}
        
        self.name = name
        self.model = model
        self.crew = crew
        self.starshipClass = starshipClass
    }
} // End of class



