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
        navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    func start() {
        let controller = CurrentLocationViewController.instance()
        setUpCurrentLocationViewController(controller)
        navigationController.setViewControllers([controller], animated: false)
    }
    
    private func setUpCurrentLocationViewController(_ controller: CurrentLocationViewController) {
        controller.onSelectLocation = { [unowned self] in
            self.goToSelectLocation()
        }
    }
    
    private func goToSelectLocation() {
        let controller = SelectLocationViewController.instance()
        setUpSelectLocationViewController(controller)
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func setUpSelectLocationViewController(_ controller: SelectLocationViewController) {
        let currentLocationViewController = navigationController.viewControllers.first { viewController -> Bool in
            viewController is CurrentLocationViewController
        } as? CurrentLocationViewController
        
        controller.onLocationSelected = { [weak currentLocationViewController, unowned self] selectedLocation in
            currentLocationViewController?.setCurrentLocation(selectedLocation)
            self.navigationController.popViewController(animated: true)
        }
    }
    
}
