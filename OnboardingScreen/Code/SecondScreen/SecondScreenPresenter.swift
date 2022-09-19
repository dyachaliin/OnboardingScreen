//
//  SecondScreenPresenter.swift
//  OnboardingScreen
//
//  Created by Alina Diachenko on 18.09.2022.
//

import UIKit

protocol SecondScreenVCProtocol: UIViewController {
    var presenter: SecondScreenPresenterProtocol { get set }
    var delegate: SecondScreenDelegate? { get set }
    func updatePage(model: OnboardingItemModel, scrollTo: Int, animate: Bool, scroll: Bool)
    func presentAlert()
}

protocol SecondScreenPresenterProtocol: AnyObject {
    var managedView: SecondScreenVCProtocol? { get set }

    var currentIndex: Int { get set }
    var items: [OnboardingItemModel] { get }
    func numberOfItems() -> Int
    func model(at index: Int) -> OnboardingItemModel?
    func setCurrentItem(at index: Int, animate: Bool, scroll: Bool) 
    func setNextIndex()
}

class SecondScreenPresenter: SecondScreenPresenterProtocol {
    
    weak var managedView: SecondScreenVCProtocol?
    
    var currentIndex: Int = 0
    var items: [OnboardingItemModel]
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var manager: ThirdScreenManager?
    
    init(){
        items = OnboardingFactory().createItems()
        getManager()
    }
    
    func numberOfItems() -> Int {
        return items.count
    }

    func model(at index: Int) -> OnboardingItemModel? {
        return items[safe: index]
    }

    func setNextIndex() {
        if items.count > currentIndex + 1 {
            setCurrentItem(at: currentIndex + 1, animate: true, scroll: true)
        } else {
            if let managedView = managedView {
                if manager?.hasBeenDisplayed == true {
                    managedView.presentAlert()
                } else {
                    managedView.delegate?.navigateToThirdPage()
                }
            }
        }
    }
    
    func setCurrentItem(at index: Int, animate: Bool, scroll: Bool) {
        if let managedView = managedView, let item = items[safe: index] {
            let animate = currentIndex == index ? false : true
            currentIndex = index
            managedView.updatePage(model: item, scrollTo: index, animate: animate, scroll: scroll)
        }
    }
    
    func getManager() {
        do {
            manager = try context.fetch(ThirdScreenManager.fetchRequest()).first
        }
        catch let error {
            print(error.localizedDescription)
        }
    }
    
}
