//
//  MockMealRecipePresenter.swift
//  RecipeRoamerTests
//
//  Created by Alphan Ogün on 7.02.2024.
//

import Foundation
@testable import RecipeRoamer

class MockMealRecipePresenter: MealRecipeViewOutput {
    weak var view: MealRecipeViewInput!
    
    //MARK: - View Properties
    var viewLoaded = false
    
    //MARK: - Interactor Properties
    var mealReceived = false
    var meal: Meal?
    
    //MARK: - View Output
    
    func viewDidLoad() {
        viewLoaded = true
    }
}

//MARK: - Interactor Output

extension MockMealRecipePresenter: MealRecipeInteractorOutput {
    func interactor(_ interactor: RecipeRoamer.MealRecipeInteractorInput, didReceiveMeal meal: RecipeRoamer.Meal) {
        mealReceived = true
        self.meal = meal
    }
    
    
}
