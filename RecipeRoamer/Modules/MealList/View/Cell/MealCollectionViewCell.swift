//
//  MealCollectionViewCell.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 26.01.2024.
//

import UIKit
import Kingfisher
import Alamofire

final class MealCollectionViewCell: UICollectionViewCell {
    //MARK: - Properties
    
    private let mealImageView = UIImageView()
    
    private let tagLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.textAlignment = .right
        label.layer.backgroundColor = UIColor.darkGray.cgColor
        label.layer.cornerRadius = 6
        label.layer.opacity = 0.9
        label.addShadow()
        return label
    }()
    
    private let mealLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalError)
    }
    
    //MARK: - Helpers
    
    func configureCell(with meal: Meal) {
        addSubview(mealImageView)
        mealImageView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor)
        
        addSubview(tagLabel)
        tagLabel.anchor(top: mealImageView.topAnchor, right: mealImageView.rightAnchor,
                        paddingTop: 8, paddingRight: 8)
        
        addSubview(mealLabel)
        mealLabel.anchor(top: mealImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        mealLabel.text = meal.name
        tagLabel.text = meal.tags
        
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

//MARK: - Constants

extension MealCollectionViewCell {
    struct Constants {
        static let cornerRadius: CGFloat = 20
        static let fatalError = "init(coder:) has not been implemented"
    }
}
