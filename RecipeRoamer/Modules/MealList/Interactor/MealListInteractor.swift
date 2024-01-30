//
//  MealListInteractor.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 26.01.2024.
//

import Foundation

protocol MealListInteractorOutput: AnyObject {
    func interactor(_ interactor: MealListInteractorInput, didReceiveMeals meals: [MealProtocol])
    func interactor(_ interactor: MealListInteractorInput, didReceiveQueryResults meals: [MealProtocol])
    func interactor(_ interactor: MealListInteractorInput, didFailWith error: Error)
}

class MealListInteractor {
    
    //MARK: - Properties
    
    weak var presenter: MealListInteractorOutput!
    let networkManager: NetworkManaging
    var meals = [MealProtocol]()
    var isFetching = false
    var isSearching = false
    
    var fetchList = Array("abcdefghijklmnopqrstuvwxyz")
    var fetchIndex = 0
    
    init(networkManager: NetworkManaging = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    private func reset() {
        meals.removeAll()
        fetchIndex = 0
        isFetching = false
        isSearching = false
    }
    
    private func canFetch() -> Bool {
        return fetchIndex < fetchList.count
    }
    
}

extension MealListInteractor: MealListInteractorInput {
    func fetchMeals() async {
        
        guard canFetch() else {
            return presenter.interactor(self, didReceiveMeals: self.meals)
        }
        
        do {
            for _ in 0..<2 {
                isFetching = true
                let request = MealAPI.fetchMeals(letter: String(fetchList[fetchIndex]))
                let response: MealListResponse = try await networkManager.request(request)
                isFetching = false
                fetchIndex += 1
                
                let meals: [Meal] = response.meals.map { .init(from: $0) }
                self.meals += meals
            }
            
            self.presenter.interactor(self, didReceiveMeals: self.meals)
        } catch {
            presenter.interactor(self, didFailWith: error)
        }
    }
    
    func searchMeal(query: String) async {
        isSearching = true
        
        guard !query.isEmpty else {
            reset()
            await fetchMeals()
            //            await fetchMeals()
            return
        }
        do {
            let request = MealAPI.searchMeal(query: query)
            let response: MealListResponse = try await networkManager.request(request)
            let meals: [Meal] = response.meals.map { .init(from: $0) }
            self.meals = meals
            self.presenter.interactor(self, didReceiveQueryResults: self.meals)
        } catch {
            presenter.interactor(self, didFailWith: error)
        }
    }
    
    
}
