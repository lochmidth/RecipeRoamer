//
//  MealRecipePresenter.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 27.01.2024.
//

import UIKit

protocol MealRecipeViewInput: AnyObject {
    func reload(with meal: Meal)
}

protocol MealRecipeInteractorInput: AnyObject {
    func fetch()
}

class MealRecipePresenter {
    
    //MARK: - Properties
    
    weak var view: MealRecipeViewInput!
    var interactor: MealRecipeInteractorInput
    var meal: Meal?
    
    //MARK: - Lifecycle
    
    init(view: MealRecipeViewInput!, interactor: MealRecipeInteractorInput) {
        self.view = view
        self.interactor = interactor
    }
    
}

extension MealRecipePresenter: MealRecipeViewOutput {
    func viewDidLoad() {
        interactor.fetch()
    }
    
    func configureCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealCell", for: indexPath)
        var content = UIListContentConfiguration.valueCell()
            
            switch indexPath.row {
            case 0:
                content.text = meal?.name
                content.prefersSideBySideTextAndSecondaryText = true
                content.secondaryText = meal?.tags
                content.image = UIImage(systemName: "fork.knife")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            case 1:
                content.text = meal?.ingredients.joined(separator: "\n")
                content.image = UIImage(systemName: "list.bullet")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            case 2:
                content.text = meal?.instruction
                content.image = UIImage(systemName: "book")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            default:
                break
            }
            
            cell.contentConfiguration = content
        return cell
    }
    
    
}

extension MealRecipePresenter: MealRecipeInteractorOutput {
    func interactor(_ interactor: MealRecipeInteractorInput, didReceiveMeal meal: Meal) {
        self.meal = meal
        view.reload(with: meal)
    }
}
