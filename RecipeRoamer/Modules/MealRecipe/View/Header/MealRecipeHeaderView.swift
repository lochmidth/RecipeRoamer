//
//  MealRecipeHeaderView.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 27.01.2024.
//

import UIKit
import Kingfisher

class MealRecipeHeaderView: UIView {
    
    private enum Constants {
        static let cornerRadius: CGFloat = 20
    }
    
    //MARK: - Properties
    
    private let mealImageView: UIImageView = {
        let frame = CGRect(x: 0, y: 0, width: 273, height: 277)
        let iv = UIImageView(frame: frame)
        return iv
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func configure(with meal: Meal?) {
        addSubview(mealImageView)
        mealImageView.center(inView: self)
        
        let processor = RoundCornerImageProcessor(cornerRadius: Constants.cornerRadius)
        mealImageView.kf.indicatorType = .activity
        mealImageView.kf.setImage(
            with: meal?.imageUrl,
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
}
