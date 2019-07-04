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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func startFlowButtonTapped(_ sender: Any) {
        onStart?()
    }

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}
