//
//  ThirdScreenManager+CoreDataProperties.swift
//  OnboardingScreen
//
//  Created by Alina Diachenko on 19.09.2022.
//
//

import Foundation
import CoreData


extension ThirdScreenManager {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ThirdScreenManager> {
        return NSFetchRequest<ThirdScreenManager>(entityName: "ThirdScreenManager")
    }

    @NSManaged public var hasBeenDisplayed: Bool

}

extension ThirdScreenManager : Identifiable {

}
