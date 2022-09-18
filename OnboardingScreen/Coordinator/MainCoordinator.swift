//
//  MainCoordinator.swift
//  OnboardingScreen
//
//  Created by Alina Diachenko on 17.09.2022.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    func eventOccured(with type: Event) {
        switch type {
        case .firstBtnTapped:
            var vc: UIViewController & Coordinating = SecondScreenVC()
            vc.coordinator = self
            navigationController?.present(vc, animated: true)
        case .secondBtnTapped:
            break
        case .thirdBtnTapped:
            break
        }
    }
    
    func start() {
        var vc: UIViewController & Coordinating = FirstScreenVC()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
    }
}
