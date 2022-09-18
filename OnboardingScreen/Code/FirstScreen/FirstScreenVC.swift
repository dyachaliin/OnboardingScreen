//
//  FirstScreenVC.swift
//  OnboardingScreen
//
//  Created by Alina Diachenko on 17.09.2022.
//

import UIKit

protocol FirstScreenDelegate: AnyObject {
    func navigateToNextPage()
}

class FirstScreenVC: UIViewController {
    
    public weak var delegate: FirstScreenDelegate?

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
        self.delegate?.navigateToNextPage()
    }
    
}
