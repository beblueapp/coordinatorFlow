//
//  FirstFlowCoordinator.swift
//  CoodinatorProofOfConcept
//
//  Created by José Victor Pereira Costa on 04/07/19.
//  Copyright © 2019 jv. All rights reserved.
//

import UIKit

class FirstFlowCoordinator: Coordinator {
    
    var parent: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    weak var parentCoordinator: MainCoordinator?

    func start() {
        let viewController = FirstScreenViewController.instance()
        
        viewController.onNext = { [unowned self] in
            self.goToSecond()
        }
        
        navigationController.setViewControllers([viewController], animated: true)
    }
    
    func goToSecond() {
        let viewController = SecondScreenViewController.instance()
        viewController.onFinish = { [unowned self] in
            self.onFlowFinish()
        }
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func onFlowFinish() {
        navigationController.dismiss(animated: true)
        parentCoordinator?.childDidFinish(self)
    }
}

