//
//  MockMealRecipeInteractor.swift
//  RecipeRoamerTests
//
//  Created by Alphan Ogün on 7.02.2024.
//

import Foundation
@testable import RecipeRoamer

class MockMealRecipeInteractor: MealRecipeInteractorInput {
    
    weak var presenter: MealRecipeInteractorOutput!
    var fetched = false
    var suspendInteractor = false
    
    func fetch() {
        fetched = true
        guard !suspendInteractor else {
            return
        }
        presenter.interactor(self, didReceiveMeal: mockMeals[0])
    }
}
