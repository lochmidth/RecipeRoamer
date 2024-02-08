//
//  MockMealListRouter.swift
//  RecipeRoamerTests
//
//  Created by Alphan Ogün on 7.02.2024.
//

import Foundation
@testable import RecipeRoamer

class MockMealListRouter: MealListRouterInput {
    
    var meal: Meal?
    var showRecipeCalled = false
    var didShowAlert = false
    var alertTitle = ""
    var alertMessage = ""
    
    func showRecipe(with meal: RecipeRoamer.Meal) {
        showRecipeCalled = true
        self.meal = meal
    }
    
    func showAlert(title: String, message: String) {
        didShowAlert = true
        alertTitle = title
        alertMessage = message
    }
}
