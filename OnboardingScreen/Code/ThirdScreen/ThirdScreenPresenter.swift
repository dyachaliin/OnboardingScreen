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
    
    func createManager()
    func updateManager()
}

class ThirdScreenPresenter: ThirdScreenPresenterProtocol {

    weak var managedView: ThirdScreenVCProtocol?
    private var manager: ThirdScreenManager?
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func createManager() {
        let manager = ThirdScreenManager(context: context)
        manager.hasBeenDisplayed = false
        self.manager = manager
        
        do {
          try context.save()
        }
        catch let error {
            print(error.localizedDescription)
        }
    }
    
    func updateManager() {
        manager?.hasBeenDisplayed = true
        do {
          try context.save()
        }
        catch let error {
            print(error.localizedDescription)
        }
    }
}
