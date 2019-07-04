//
//  SecondScreenViewController.swift
//  CoodinatorProofOfConcept
//
//  Created by José Victor Pereira Costa on 04/07/19.
//  Copyright © 2019 jv. All rights reserved.
//

import UIKit

class SecondScreenViewController: UIViewController {
    
    var onFinish: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func finishButtonTapped(_ sender: Any) {
        onFinish?()
    }
    
}
