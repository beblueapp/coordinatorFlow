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
        setUpFirstSceneViewController(viewController)
        navigationController.setViewControllers([viewController], animated: true)
    }
    
    private func goToSecond() {
        let viewController = SecondSceneViewController.instance()
        setUpSecondSceneViewController(viewController)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    private func onFlowFinish() {
        navigationController.dismiss(animated: true)
        parent?.childDidFinish(self)
    }
    
    private func setUpFirstSceneViewController(_ controller: FirstSceneViewController) {
        controller.onNext = { [unowned self] in
            self.goToSecond()
        }
        
        controller.onCancel = { [unowned self] in
            self.navigationController.dismiss(animated: true)
        }
    }
    
    private func setUpSecondSceneViewController(_ controller: SecondSceneViewController) {
        controller.onFinish = { [unowned self] in
            self.onFlowFinish()
        }
    }
}

