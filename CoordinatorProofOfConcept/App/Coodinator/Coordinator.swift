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
    
    func start()
}

extension Coordinator {
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
}
