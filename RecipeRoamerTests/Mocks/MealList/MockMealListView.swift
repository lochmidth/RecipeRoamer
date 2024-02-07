//
//  MockMealListView.swift
//  RecipeRoamerTests
//
//  Created by Alphan Ogün on 7.02.2024.
//

import Foundation
@testable import RecipeRoamer

class MockMealListView: MealListViewInput {
    
    var title: String?
    var navigationBarConfigured = false
    var keyboardDismissalConfigured = false
    var isLoading = false
    var reloaded = false
    var meals = [Meal]()
    
    func configureNavigationBar() {
        navigationBarConfigured = true
    }
    
    func configureKeyboardDismissal() {
        keyboardDismissalConfigured = true
    }
    
    func showLoading() {
        isLoading = true
    }
    
    func hideLoading() {
        isLoading = false
    }
    
    func reload(with meals: [RecipeRoamer.Meal]) {
        reloaded = true
        self.meals = meals
    }
    
    
}
