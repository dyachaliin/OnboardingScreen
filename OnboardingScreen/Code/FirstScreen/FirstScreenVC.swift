//
//  FirstScreenVC.swift
//  OnboardingScreen
//
//  Created by Alina Diachenko on 17.09.2022.
//

import UIKit

class FirstScreenVC: UIViewController, Coordinating {
    var coordinator: Coordinator?

    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    private func setupView() {
        startButton.layer.cornerRadius = 10
    }
    
    @IBAction func startBtnPressed(_ sender: UIButton) {
        coordinator?.eventOccured(with: .firstBtnTapped)
    }
    
}
