//
//  MockMeal.swift
//  RecipeRoamerTests
//
//  Created by Alphan Ogün on 6.02.2024.
//

import Foundation
@testable import RecipeRoamer

let mockMeals: [Meal] = mockMealListResponse.meals.map({ .init(from: $0) })
