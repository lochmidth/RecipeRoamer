//
//  MealRecipeInteractor.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 27.01.2024.
//

import Foundation

protocol MealRecipeInteractorOutput: AnyObject {
    func interactor(_ interactor: MealRecipeInteractorInput, didReceiveMeal meal: MealProtocol)
}

class MealRecipeInteractor {
    
    //MARK: - Properties
    
    weak var presenter: MealRecipeInteractorOutput!
    let meal : MealProtocol
    
    init(meal: MealProtocol) {
        self.meal = meal
    }
}

extension MealRecipeInteractor: MealRecipeInteractorInput {
    func fetch() {
        presenter.interactor(self, didReceiveMeal: self.meal)
    }
}
