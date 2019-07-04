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
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = MainViewController.instance()
        
        viewController.onStart = { [unowned self] in
            self.goToFirst()
        }
        
        navigationController.setViewControllers([viewController], animated: false)
    }
    
    func goToFirst() {
        let childCoordinator = firstFlowCoordinator()
        self.navigationController.present(childCoordinator.navigationController, animated: true)
        childCoordinator.start()
    }
    
    private func firstFlowCoordinator() -> FirstFlowCoordinator {
        let navigationController = UINavigationController()
        let firstFlowCoordinator = FirstFlowCoordinator(navigationController: navigationController)
        firstFlowCoordinator.parentCoordinator = self
        childCoordinators.append(firstFlowCoordinator)
        return firstFlowCoordinator
    }
    
}
