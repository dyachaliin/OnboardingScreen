//
//  TimeInterval+Exntension.swift
//  OnboardingScreen
//
//  Created by Alina Diachenko on 19.09.2022.
//

import Foundation

extension TimeInterval {
    func timeToString() -> String {
        let minutes = Int(self) / 60 % 60
        let seconds = Int(self) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
   
}
