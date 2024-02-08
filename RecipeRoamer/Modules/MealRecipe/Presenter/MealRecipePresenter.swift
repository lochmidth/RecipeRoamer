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

final class MealRecipePresenter {
    
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

//MARK: - MealRecipeViewOutput

extension MealRecipePresenter: MealRecipeViewOutput {
    func viewDidLoad() {
        interactor.fetch()
    }
}

//MARK: - MealRecipeInteractorOutput

extension MealRecipePresenter: MealRecipeInteractorOutput {
    func interactor(_ interactor: MealRecipeInteractorInput, didReceiveMeal meal: Meal) {
        self.meal = meal
        view.reload(with: meal)
    }
}
