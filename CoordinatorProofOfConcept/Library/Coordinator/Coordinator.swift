//
//  Coordinator.swift
//  CoodinatorProofOfConcept
//
//  Created by José Victor Pereira Costa on 04/07/19.
//  Copyright © 2019 jv. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    var parent: Coordinator? { get set }
    
    init(navigationController: UINavigationController)
    
    func start()
    
}

extension Coordinator {
    
    static func instance(parent: Coordinator? = nil) -> Self {
        let navigationController = UINavigationController()
        let coordinator = Self.init(navigationController: navigationController)
        coordinator.parent = parent
        parent?.childCoordinators.append(coordinator)
        return coordinator
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
