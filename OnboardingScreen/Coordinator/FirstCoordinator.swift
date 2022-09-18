//
//  FirstCoordinator.swift
//  OnboardingScreen
//
//  Created by Alina Diachenko on 18.09.2022.
//

import UIKit

class FirstCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    let navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc: FirstScreenVC = FirstScreenVC()
        vc.delegate = self
        self.navigationController.viewControllers = [vc]
    }
}

extension FirstCoordinator: FirstScreenDelegate {

    func navigateToNextPage() {
       let secondCoordinator = SecondCoordinator(navigationController: navigationController)
       childCoordinators.append(secondCoordinator)
       secondCoordinator.start()
    }
}
