//
//  OnboardingFactory.swift
//  OnboardingScreen
//
//  Created by Alina Diachenko on 18.09.2022.
//

import Foundation
import UIKit

struct OnboardingItemModel {
    let image: UIImage
    let title: String
    let description: String
    let buttonText: String
}

class OnboardingFactory: NSObject {

    func createItems() -> [OnboardingItemModel] {
        
        return [
            OnboardingItemModel(image: UIImage(named: "firstImage")!, title: "Boost Productivity", description: "Take your productivity to the next level", buttonText: "Next"),
            OnboardingItemModel(image: UIImage(named: "secondImage")!, title: "Work Seamlessly", description: "Get your work done seamlessly without interruption", buttonText: "Next"),
            OnboardingItemModel(image: UIImage(named: "thirdImage")!, title: "Achieve Your Goals", description: "Boosted productivity will help you achieve the desired goals", buttonText: "Continue")
           ]
    }
}
