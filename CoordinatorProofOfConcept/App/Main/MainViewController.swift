//
//  MainViewController.swift
//  CoodinatorProofOfConcept
//
//  Created by José Victor Pereira Costa on 04/07/19.
//  Copyright © 2019 jv. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var onStart: (() -> Void)?
    var onPassingDataExample: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func startFlowButtonTapped(_ sender: Any) {
        onStart?()
    }
    
    @IBAction func passingDataBackButtonTapped(_ sender: Any) {
        onPassingDataExample?()
    }
    

}
