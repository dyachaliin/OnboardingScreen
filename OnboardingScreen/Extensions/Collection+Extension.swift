//
//  Collection+Extension.swift
//  OnboardingScreen
//
//  Created by Alina Diachenko on 18.09.2022.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
