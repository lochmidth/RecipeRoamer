//
//  MockMealRecipeView.swift
//  RecipeRoamerTests
//
//  Created by Alphan Ogün on 7.02.2024.
//

import UIKit
@testable import RecipeRoamer

class MockMealRecipeView: MealRecipeViewInput {
    
    var meal: Meal?
    var reloaded = false
    
    func reload(with meal: RecipeRoamer.Meal) {
        self.meal = meal
        reloaded = true
    }
    
    
}
