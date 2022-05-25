//
//  StarshipListTableViewController.swift
//  Starships
//
//  Created by Scott Cox on 5/24/22.
//

import UIKit

class StarshipListTableViewController: UITableViewController {

    var starships: [Starship] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        StarshipController.fetchStarships { starships in
            let starships = starships
            self.starships = starships
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return starships.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "starshipCell", for: indexPath)

        let starship = starships[indexPath.row]
        var starshipCellConfiguration = cell.defaultContentConfiguration()
        starshipCellConfiguration.text = "\(starship.name) || Model: \(starship.model)"
        starshipCellConfiguration.secondaryText = "Crew: \(starship.crew) || Class: \(starship.starshipClass)"
        cell.contentConfiguration = starshipCellConfiguration
        return cell
    }
   
}// End of class
