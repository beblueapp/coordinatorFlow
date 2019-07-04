//
//  MainCoordinator.swift
//  CoodinatorProofOfConcept
//
//  Created by José Victor Pereira Costa on 04/07/19.
//  Copyright © 2019 jv. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    
    var parent: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = MainViewController.instance()
        
        viewController.onStart = { [unowned self] in
            self.goToFirst()
        }
        
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    // MARK: - Simple Flow
    
    func goToFirst() {
        let firstFlowCoordinator = FirstFlowCoordinator.instance(parent: self)
        self.navigationController.present(firstFlowCoordinator.navigationController, animated: true)
        firstFlowCoordinator.start()
    }
    
    // MARK: - Passing data back example Flow
    
    func goToCurrentLocation() {
        let currentLocationCoordinator = CurrentLocationCoordinator.instance(parent: self)
        self.navigationController.present(currentLocationCoordinator.navigationController, animated: true)
        currentLocationCoordinator.start()
    }
        
}
