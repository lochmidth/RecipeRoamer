//
//  MealListInteractor.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 26.01.2024.
//

import Foundation

protocol MealListInteractorOutput: AnyObject {
    func interactor(_ interactor: MealListInteractorInput, didReceiveMeals meals: [Meal])
    func interactor(_ interactor: MealListInteractorInput, didReceiveQueryResults meals: [Meal])
    func interactor(_ interactor: MealListInteractorInput, didFailWith error: Error)
}

final class MealListInteractor {
    
    //MARK: - Properties
    
    weak var presenter: MealListInteractorOutput!
    private let mealService: MealServicing
    private var meals = [Meal]()
    
    private var isFetching = false
    private var isSearching = false
    
    private var fetchList = Constants.fetchListArray
    private var fetchIndex = Constants.initialFetchIndex
    
    //MARK: - Lifecycle
    
    init(mealService: MealServicing = MealService()) {
        self.mealService = mealService
    }
    
    //MARK: - Helpers
    
    private func reset() {
        meals.removeAll()
        fetchIndex = Constants.initialFetchIndex
        isFetching = false
        isSearching = false
    }
    
    private func canFetch() -> Bool {
        return fetchIndex < fetchList.count && isFetching == false
    }
}

//MARK: - MealListInteractorInput

extension MealListInteractor: MealListInteractorInput {
    func fetchMeals() async {
        guard canFetch() else {
            return presenter.interactor(self, didReceiveMeals: self.meals)
        }
        do {
            for _ in 0..<2 {
                isFetching = true
                let response = try await mealService.fetchMeals(by: String(fetchList[fetchIndex]))
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
            return
        }
        do {
            let response = try await mealService.searchMeal(query)
            let meals: [Meal] = response.meals.map { .init(from: $0) }
            self.meals = meals
            self.presenter.interactor(self, didReceiveQueryResults: self.meals)
        } catch {
            presenter.interactor(self, didFailWith: error)
        }
    }
}

//MARK: - Constants

extension MealListInteractor {
    struct Constants {
        static let fetchListArray = Array("abcdefghijklmnopqrstuvwxyz")
        static let initialFetchIndex: Int = 0
    }
}
