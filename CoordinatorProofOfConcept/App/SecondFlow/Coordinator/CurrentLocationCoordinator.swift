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
    
    private var currentLocationViewController: CurrentLocationViewController?
    
    weak var parent: Coordinator?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = CurrentLocationViewController.instance()
        currentLocationViewController = controller
        setUpCurrentLocationViewController(controller)
        navigationController.setViewControllers([controller], animated: false)
    }
    
    private func setUpCurrentLocationViewController(_ controller: CurrentLocationViewController) {
        controller.onSelectLocation = { [unowned self] in
            self.goToSelectLocationWithClosure()
        }
        controller.onCancel = { [unowned self] in
            self.navigationController.dismiss(animated: true)
        }
    }
    
    private func goToSelectLocationWithClosure() {
        let controller = SelectLocationViewController.instance()
        setUpSelectLocationViewController(controller)
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func setUpSelectLocationViewController(_ controller: SelectLocationViewController) {
        controller.onLocationSelected = { [weak currentLocationViewController, unowned self] selectedLocation in
            currentLocationViewController?.setCurrentLocation(selectedLocation)
            self.navigationController.popViewController(animated: true)
        }
    }
    
}

