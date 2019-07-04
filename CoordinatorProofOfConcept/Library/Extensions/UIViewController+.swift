//
//  UIViewController.swift
//  CoodinatorProofOfConcept
//
//  Created by José Victor Pereira Costa on 04/07/19.
//  Copyright © 2019 jv. All rights reserved.
//

import UIKit

protocol StoryboardBased {
    static func instance() -> Self
}

extension StoryboardBased {
    static func instance() -> Self {
        let storyboard = UIStoryboard(name: "\(Self.self)", bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController() as? Self else {
            fatalError()
        }
        
        return viewController
    }
}

extension UIViewController: StoryboardBased { }
