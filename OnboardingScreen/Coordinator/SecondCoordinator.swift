//
//  SecondCoordinator.swift
//  OnboardingScreen
//
//  Created by Alina Diachenko on 18.09.2022.
//

import UIKit

class SecondCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    let navigationController: UINavigationController
    var presenterVC: UIViewController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc: SecondScreenVC = SecondScreenVC()
        vc.delegate = self
        self.presenterVC = vc
        self.navigationController.present(vc, animated: true)
        
    }
}

extension SecondCoordinator: SecondScreenDelegate {
    func navigateToThirdPage() {
        let vc: ThirdScreenVC = ThirdScreenVC()
        vc.delegate = self
        presenterVC?.present(vc, animated: true)
    }
}
