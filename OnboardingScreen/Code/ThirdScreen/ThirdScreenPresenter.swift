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
    func updateManager()
}

class ThirdScreenPresenter: ThirdScreenPresenterProtocol {

    weak var managedView: ThirdScreenVCProtocol?
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func updateManager() {
        do {
          try context.fetch(ThirdScreenManager.fetchRequest()).first?.hasBeenDisplayed = true
          try context.save()
        }
        catch let error {
            print(error.localizedDescription)
        }
    }
}
