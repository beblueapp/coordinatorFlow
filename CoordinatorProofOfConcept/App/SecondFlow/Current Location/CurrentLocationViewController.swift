//
//  CurrentLocationViewController.swift
//  CoordinatorProofOfConcept
//
//  Created by Caio Sanchez Santos Costa on 04/07/19.
//  Copyright © 2019 jv. All rights reserved.
//

import UIKit

class CurrentLocationViewController: UIViewController {
    
    @IBOutlet weak var currentLocationLabel: UILabel!
    
    var onSelectLocation: (() -> Void)?
    var onCancel: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectLocationButtonTapped(_ sender: Any) {
        onSelectLocation?()
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        onCancel?()
    }
    
    public func setCurrentLocation(_ location: String) {
        currentLocationLabel.text = location
    }
    
}
