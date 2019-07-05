//
//  SelectLocationViewController.swift
//  CoordinatorProofOfConcept
//
//  Created by Caio Sanchez Santos Costa on 04/07/19.
//  Copyright © 2019 jv. All rights reserved.
//

import UIKit

class SelectLocationViewController: UIViewController {
    
    var onLocationSelected: ((String) -> Void)?
    
    let cities = ["Ribeirão Preto", "Uberlândia", "São Paulo", "Brasília"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension SelectLocationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = cities[indexPath.row]
        return cell
    }
    
}

extension SelectLocationViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedLocation = cities[indexPath.row]
        onLocationSelected?(selectedLocation)
    }
    
}
