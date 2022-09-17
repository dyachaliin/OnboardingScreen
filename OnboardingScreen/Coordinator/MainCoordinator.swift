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
        
    }
    
    func start() {
        var vc: UIViewController & Coordinating = FirstScreenVC()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)
    }
}
