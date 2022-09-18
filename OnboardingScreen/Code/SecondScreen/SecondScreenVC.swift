//
//  SecondScreenVC.swift
//  OnboardingScreen
//
//  Created by Alina Diachenko on 17.09.2022.
//

import UIKit

class SecondScreenVC: UIViewController, Coordinating, SecondScreenVCProtocol {
 
    var presenter: SecondScreenPresenterProtocol
    var coordinator: Coordinator?
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    required init() {
        presenter = SecondScreenPresenter()
        super.init(nibName: "SecondScreenVC", bundle: nil)
        presenter.managedView = self
        modalPresentationStyle = .fullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    private func setupView() {
        nextButton.layer.cornerRadius = 10
    }
    
    func setupCollectionView(){
        collectionView.register(UINib(nibName: "OnboardingCell", bundle: nil), forCellWithReuseIdentifier: OnboardingCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    @IBAction func nextBtnTapped(_ sender: UIButton) {
        presenter.setNextIndex()
    }
    
    func updatePage(model: OnboardingItemModel, scrollTo: Int, animate: Bool, scroll: Bool) {
        if scroll {
            collectionView.scrollToItem(at: IndexPath(item: scrollTo, section: 0), at: .centeredHorizontally, animated: animate)
        }
        pageControl.currentPage = scrollTo
        UIView.transition(with: nextButton, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.nextButton.setTitle(model.buttonText, for: .normal)
        }, completion: nil)
        
    }
}

extension SecondScreenVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let model = presenter.model(at: indexPath.row),
              let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.identifier, for: indexPath) as? OnboardingCell else { return UICollectionViewCell() }
        cell.model = model
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:  CGFloat(collectionView.frame.size.width), height: CGFloat(collectionView.frame.size.height))
    }
   
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentIndex = self.collectionView.contentOffset.x / self.collectionView.frame.size.width
        presenter.setCurrentItem(at: Int(currentIndex), animate: true, scroll: false)
    }
}
