//
//  MockMealListInteractor.swift
//  RecipeRoamerTests
//
//  Created by Alphan Ogün on 7.02.2024.
//

import Foundation
@testable import RecipeRoamer

class MockMealListInteractor: MealListInteractorInput {
    
    weak var presenter: MealListInteractorOutput!
    
    var fetchMealsCalled = false
    var mealsSearched = false
    var shouldFail = false
    var suspendInteractor = false
    
    func fetchMeals() async {
        fetchMealsCalled = true
        guard !suspendInteractor else {
            return
        }
        if shouldFail {
            presenter.interactor(self, didFailWith: MockError.someError)
        } else {
            presenter.interactor(self, didReceiveMeals: mockMeals)
        }
    }
    
    func searchMeal(query: String) async {
        mealsSearched = true
        guard !suspendInteractor else {
            return
        }
        if shouldFail {
            presenter.interactor(self, didReceiveQueryResults: mockMeals)
        } else {
            presenter.interactor(self, didNotReceiveAnyMeals: [Meal]())
        }
    }
}

