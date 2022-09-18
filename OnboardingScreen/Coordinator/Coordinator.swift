//
//  Coordinator.swift
//  OnboardingScreen
//
//  Created by Alina Diachenko on 17.09.2022.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    init(navigationController: UINavigationController)
    func start()
}
