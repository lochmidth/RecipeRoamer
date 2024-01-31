//
//  MealRecipeTableViewCell.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 31.01.2024.
//

import UIKit

final class MealRecipeTableViewCell: UITableViewCell {
    //MARK: - Properties
    
    private var meal: Meal?
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalError)
    }
    
    //MARK: - Helpers
    
    func configureCell(with meal: Meal?, indexPath: IndexPath) -> UIListContentConfiguration {
        var content = UIListContentConfiguration.valueCell()
            
            switch indexPath.row {
            case 0:
                content.text = meal?.name
                content.prefersSideBySideTextAndSecondaryText = true
                content.secondaryText = meal?.tags
                content.image = UIImage(systemName: Constants.forkKnifeImage)?.withTintColor(.black, renderingMode: .alwaysOriginal)
            case 1:
                content.text = meal?.ingredients.joined(separator: Constants.newLine)
                content.image = UIImage(systemName: Constants.listImage)?.withTintColor(.black, renderingMode: .alwaysOriginal)
            case 2:
                content.text = meal?.instruction
                content.image = UIImage(systemName: Constants.bookImage)?.withTintColor(.black, renderingMode: .alwaysOriginal)
            default:
                break
            }
        return content
    }
}

//MARK: - Constants

extension MealRecipeTableViewCell {
    struct Constants {
        static let reuseIdentifier = "MealRecipeCell"
        static let forkKnifeImage = "fork.knife"
        static let newLine = "\n"
        static let listImage = "list.bullet"
        static let bookImage = "book"
        static let fatalError = "init(coder:) has not been implemented"
    }
}

