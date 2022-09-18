//
//  ThirdScreenPresenter.swift
//  OnboardingScreen
//
//  Created by Alina Diachenko on 18.09.2022.
//

import Foundation
import UIKit

protocol ThirdScreenVCProtocol: UIViewController {
    var presenter: ThirdScreenPresenterProtocol { get set }
}

protocol ThirdScreenPresenterProtocol: AnyObject {
    var managedView: ThirdScreenVCProtocol? { get set }
}

class ThirdScreenPresenter: ThirdScreenPresenterProtocol {

    weak var managedView: ThirdScreenVCProtocol?
}
