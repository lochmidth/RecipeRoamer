//
//  MealListInteractor.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 26.01.2024.
//

import Foundation

protocol MealListInteractorOutput: AnyObject {
    
}

class MealListInteractor {
    
    //MARK: - Properties
    
    weak var presenter: MealListInteractorOutput!
    let networkManager: NetworkManaging
    
    init(networkManager: NetworkManaging = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    
}

extension MealListInteractor: MealListInteractorInput {
    func fetchMeals() async throws -> MealList {
        let request = MealAPI.fetchMeals(letter: "a")
        return try await networkManager.request(request)
    }
    
    func searchMeal(query: String) async throws -> MealList {
        let request = MealAPI.searchMeal(query: query)
        return try await networkManager.request(request)
    }
    
    
}
