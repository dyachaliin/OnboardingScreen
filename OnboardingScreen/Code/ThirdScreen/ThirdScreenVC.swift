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
    @IBOutlet weak var thirdScreenView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    
    var presenter: ThirdScreenPresenterProtocol
    public weak var delegate: SecondScreenDelegate?
    
    required init() {
        presenter = ThirdScreenPresenter()
        super.init(nibName: "ThirdScreenVC", bundle: nil)
        presenter.managedView = self
        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startProgress()
        startTimer()
        presenter.updateManager()
    }
    
    private func setupView() {
        continueButton.layer.cornerRadius = 10
        continueButton.layer.opacity = 0.4
        thirdScreenView.layer.cornerRadius = 28
    }
    
    private func startTimer() {
        var seconds = 0
        var timer = Timer()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            seconds += 1
            self.timeLabel.text = TimeInterval(seconds).timeToString()
            
            if seconds == 60 {
                self.continueButton.isEnabled = true
                self.continueButton.layer.opacity = 1
                timer.invalidate()
            }
        })
    }
    
    private func startProgress() {
        var timer = Timer()
        var progress = 0.0
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            progress += 1/1200
            self.progressView.setProgress(Float(progress), animated: true)
            if self.progressView.progress == 1 {
                timer.invalidate()
            }
        }
    }
    
    @IBAction func continueBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
