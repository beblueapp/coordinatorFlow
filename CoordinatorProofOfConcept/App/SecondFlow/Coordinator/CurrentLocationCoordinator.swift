//
//  CurrentLocationCoordinator.swift
//  CoordinatorProofOfConcept
//
//  Created by Caio Sanchez Santos Costa on 04/07/19.
//  Copyright © 2019 jv. All rights reserved.
//

import UIKit

class CurrentLocationCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    weak var parent: Coordinator?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let currentLocationViewController = CurrentLocationViewController.instance()
        navigationController.setViewControllers([currentLocationViewController], animated: false)
    }
    
}
