//
//  MealRecipeInteractor.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 27.01.2024.
//

import Foundation

protocol MealRecipeInteractorOutput: AnyObject {
    func interactor(_ interactor: MealRecipeInteractorInput, didReceiveMeal meal: Meal)
}

final class MealRecipeInteractor {
    
    //MARK: - Properties
    
    weak var presenter: MealRecipeInteractorOutput!
    private let meal: Meal
    
    //MARK: - Lifecycle
    
    init(meal: Meal) {
        self.meal = meal
    }
}

//MARK: - MealRecipeInteractorInput

extension MealRecipeInteractor: MealRecipeInteractorInput {
    func fetch() {
        presenter.interactor(self, didReceiveMeal: self.meal)
    }
}
