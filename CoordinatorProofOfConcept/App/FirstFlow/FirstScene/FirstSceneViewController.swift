//
//  FirstSceneViewController.swift
//  CoodinatorProofOfConcept
//
//  Created by José Victor Pereira Costa on 04/07/19.
//  Copyright © 2019 jv. All rights reserved.
//

import UIKit

class FirstSceneViewController: UIViewController {
    
    var onNext: (() -> Void)?
    var onCancel: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        onNext?()
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        onCancel?()
    }
}
