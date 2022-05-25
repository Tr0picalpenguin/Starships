//
//  StarshipController.swift
//  Starships
//
//  Created by Scott Cox on 5/24/22.
//

import Foundation

class StarshipController {
    
    private static let baseURLString = "https://swapi.dev/api/starships"
    
    
    // CRUD
    static func fetchStarships(completion: @escaping ([Starship]) -> Void) {
        guard let baseURL = URL(string: baseURLString) else {
            // This is a point of failure, I need to complete with "something"
            completion([])
            return
        }
        // perform data task
        URLSession.shared.dataTask(with: baseURL) { data, _, error in
            // conditional unwrap
            if let error = error {
                print(error)
                // This is a point of failure, I need to complete with "something"
                completion([])
            }
            if let data = data {
                do {
                    let topLevelDictionary = try JSONSerialization.jsonObject(with: data) as? [String:Any]
                    guard let dictionary = topLevelDictionary,
                          let results = dictionary["results"] as? [[String:Any]] else {
                        // This is a point of failure, I need to complete with "something"
                        completion([])
                        return
                    }
                    var tempArray: [Starship] = []
                    for result in results {
                        guard let starship = Starship(starshipDictionary: result) else {
                            continue
                        }
                        tempArray.append(starship)
                    }
                    completion(tempArray)
                } catch {
                    print(error)
                    // This is a point of failure, I need to complete with "something"
                    completion([])
                }
            } else {
                // This is a point of failure, I need to complete with "something"
                completion([])
            }
        }.resume()
    }
} // End of class
