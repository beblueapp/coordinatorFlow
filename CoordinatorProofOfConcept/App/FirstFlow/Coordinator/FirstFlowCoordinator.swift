//
//  FirstFlowCoordinator.swift
//  CoodinatorProofOfConcept
//
//  Created by José Victor Pereira Costa on 04/07/19.
//  Copyright © 2019 jv. All rights reserved.
//

import UIKit

class FirstFlowCoordinator: Coordinator {
    
    weak var parent: Coordinator?
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = FirstSceneViewController.instance()
        
        viewController.onNext = { [unowned self] in
            self.goToSecond()
        }
        
        navigationController.setViewControllers([viewController], animated: true)
    }
    
    func goToSecond() {
        let viewController = SecondSceneViewController.instance()
        viewController.onFinish = { [unowned self] in
            self.onFlowFinish()
        }
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func onFlowFinish() {
        navigationController.dismiss(animated: true)
        parent?.childDidFinish(self)
    }
}

