//
//  ThirdScreenVC.swift
//  OnboardingScreen
//
//  Created by Alina Diachenko on 18.09.2022.
//

import UIKit

class ThirdScreenVC: UIViewController, ThirdScreenVCProtocol {
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var progressView: UIProgressView!
    
    var presenter: ThirdScreenPresenterProtocol
    public weak var delegate: SecondScreenDelegate?
    
    required init() {
        presenter = ThirdScreenPresenter()
        super.init(nibName: "ThirdScreenVC", bundle: nil)
        presenter.managedView = self
        modalPresentationStyle = .pageSheet
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startTimer()
    }
    
    private func setupView() {
        continueButton.layer.cornerRadius = 10
    }
    
    
    private func startTimer() {
        for sec in 0...60 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(sec) * 0.25) {
                self.progressView.setProgress(Float(sec)/60, animated: true)
            }
        }
    }
    
    
    @IBAction func continueBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
