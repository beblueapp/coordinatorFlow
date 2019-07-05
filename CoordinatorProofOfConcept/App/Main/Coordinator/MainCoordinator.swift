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
        setUpMainViewController(viewController)
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    private func setUpMainViewController(_ controller: MainViewController) {
        controller.onStart = { [unowned self] in
            self.goToFirst()
        }
        controller.onPassingDataExample = { [unowned self] in
            self.goToCurrentLocation()
        }
    }
    
    // MARK: - Simple Flow
    
    func goToFirst() {
        let firstFlowCoordinator = FirstFlowCoordinator.instance(parent: self)
        firstFlowCoordinator.start()
        self.navigationController.present(firstFlowCoordinator.navigationController, animated: true)
    }
    
    // MARK: - Passing data back example Flow
    
    func goToCurrentLocation() {
        let currentLocationCoordinator = CurrentLocationCoordinator.instance(parent: self)
        currentLocationCoordinator.start()
        self.navigationController.present(currentLocationCoordinator.navigationController, animated: true)
    }
        
}
