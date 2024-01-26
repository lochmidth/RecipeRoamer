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
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func configureCell() {
        addSubview(mealImageView)
        mealImageView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
        
        addSubview(mealLabel)
        mealLabel.anchor(top: mealImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        mealLabel.text = "Meal"
        
        let processor = RoundCornerImageProcessor(cornerRadius: Constants.cornerRadius)
        mealImageView.kf.indicatorType = .activity
        mealImageView.kf.setImage(
            with: URL(string: "https://www.themealdb.com/images/media/meals/cgl60b1683206581.jpg"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
}
