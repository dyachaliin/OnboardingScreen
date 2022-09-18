//
//  OnboardingCell.swift
//  OnboardingScreen
//
//  Created by Alina Diachenko on 18.09.2022.
//

import UIKit

class OnboardingCell: UICollectionViewCell {

    static let identifier = String(describing: OnboardingCell.self)
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    var model: OnboardingItemModel! {
        didSet {
            if let model = model {
                imageView.image = model.image
                titleLabel.text = model.title
                descriptionLabel.text = model.description
            }
        }
    }

}
