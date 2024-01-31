//
//  MealService.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 31.01.2024.
//

import Foundation
import Moya

protocol MealServicing {
    func fetchMeals(by letter: String) async throws -> MealListResponse
    func searchMeal(_ query: String) async throws -> MealListResponse
}

class MealService {
    
    let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
}

extension MealService: MealServicing {
    func fetchMeals(by letter: String) async throws -> MealListResponse {
        let request = MealAPI.fetchMeals(letter: letter)
        return try await networkManager.request(request)
    }
    
    func searchMeal(_ query: String) async throws -> MealListResponse {
        let request = MealAPI.searchMeal(query: query)
        return try await networkManager.request(request)
    }
    
    
}
