//
//  MealCollectionViewCell.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 26.01.2024.
//

import UIKit
import Kingfisher
import Alamofire

class MealCollectionViewCell: UICollectionViewCell {
    
    private enum Constants {
        static let cornerRadius: CGFloat = 20
    }
    
    //MARK: - Properties
    
    private let mealImageView = UIImageView()
    
    private let mealLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func configureCell(with meal: MealProtocol) {
        addSubview(mealImageView)
        mealImageView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
        
        addSubview(mealLabel)
        mealLabel.anchor(top: mealImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        mealLabel.text = meal.name
        
        let processor = RoundCornerImageProcessor(cornerRadius: Constants.cornerRadius)
        mealImageView.kf.indicatorType = .activity
        mealImageView.kf.setImage(
            with: meal.imageUrl,
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
}
