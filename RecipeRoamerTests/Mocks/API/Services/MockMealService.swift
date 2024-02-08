//
//  MockMealService.swift
//  RecipeRoamerTests
//
//  Created by Alphan Ogün on 6.02.2024.
//

import Foundation
@testable import RecipeRoamer

class MockMealService: MealServicing {
    
    var fetchMealsResult: Result<MealListResponse, Error>?
    var isFetchMealsCalled = false
    
    func fetchMeals(by letter: String) async throws -> RecipeRoamer.MealListResponse {
        isFetchMealsCalled = true
        
        if let result = fetchMealsResult {
            switch result {
            case .success(let response):
                return response
            case .failure(let error):
                throw error
            }
        } else {
            throw MockError.someError
        }
    }
    
    var searchMealResult: Result<MealListResponse, Error>?
    var isSearchMealCalled = false
    
    func searchMeal(_ query: String) async throws -> RecipeRoamer.MealListResponse {
        if let result = searchMealResult {
            switch result {
            case .success(let response):
                return response
            case .failure(let error):
                throw error
            }
        } else {
            throw MockError.someError
        }
    }
    
    
}
