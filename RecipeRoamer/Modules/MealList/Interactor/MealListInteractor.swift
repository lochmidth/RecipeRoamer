//
//  MealListInteractor.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 26.01.2024.
//

import Foundation

protocol MealListInteractorOutput: AnyObject {
    func interactor(_ interactor: MealListInteractorInput, didReceiveMeals meals: [MealProtocol])
    func interactor(_ interactor: MealListInteractorInput, didReceiveQueryResults items: [MealProtocol])
    func interactor(_ interactor: MealListInteractorInput, didFailWith error: Error)
}

class MealListInteractor {
    
    //MARK: - Properties
    
    weak var presenter: MealListInteractorOutput!
    let networkManager: NetworkManaging
    var meals = [MealProtocol]()
    var isFetching = false
    var isSearching = false
    
    init(networkManager: NetworkManaging = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    private func reset() {
        meals.removeAll()
        isFetching = false
        isSearching = false
    }
    
    
}

extension MealListInteractor: MealListInteractorInput {
    func fetchMeals(letter: String) async {
        do {
            isFetching = true
            let request = MealAPI.fetchMeals(letter: letter)
            let response: MealListResponse = try await networkManager.request(request)
            isFetching = false
            
            let meals: [Meal] = response.meals.map { .init(from: $0) }
            if self.meals.isEmpty {
                self.meals = meals
                self.presenter.interactor(self, didReceiveMeals: self.meals)
            } else {
                self.meals += meals
                self.presenter.interactor(self, didReceiveMeals: self.meals)
            }
        } catch {
            presenter.interactor(self, didFailWith: error)
        }
    }
    
    func searchMeal(query: String) async throws {
        let request = MealAPI.searchMeal(query: query)
        let response: MealListResponse = try await networkManager.request(request)
        let _: [Meal] = response.meals.map { .init(from: $0) }
        //Handle interactor output
    }
    
    
}
