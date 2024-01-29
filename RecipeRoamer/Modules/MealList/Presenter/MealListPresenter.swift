//
//  MealListPresenter.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 26.01.2024.
//

import Foundation

protocol MealListViewInput: AnyObject {
    func configureNavigationBar()
}

protocol MealListInteractorInput: AnyObject {
    func fetchMeals() async throws -> MealList
    func searchMeal(query: String) async throws -> MealList
}

protocol MealListRouterInput: AnyObject {
    
}

class MealListPresenter {
    
    weak var view: MealListViewInput!
    var interactor: MealListInteractorInput
    var router: MealListRouterInput
    
    init(view: MealListViewInput!, interactor: MealListInteractorInput, router: MealListRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func createIngredientsArray(from meal: Meal) -> [String] {
        var ingredientsArray: [String] = []
        
        for i in 1...20 {
            let ingredient = "strIngredient\(i)"
            let measure = "strMeasure\(i)"
            
            guard !ingredient.isEmpty else {
                continue
            }
            
            let combinedString = "\(measure) \(ingredient)"
            ingredientsArray.append(combinedString)
        }
        
        return ingredientsArray
    }
    
}

extension MealListPresenter: MealListViewOutput {
    func viewDidLoad() {
        Task {
            do {
                let meals = try await interactor.fetchMeals()
                print("DEBUG: \(meals.meals[0].strMeal)")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func didReachEndOfPage() {
        
    }
    
    func didSelectItem(at index: Int) {
        
    }
    
    func queryTextDidChange(_ query: String) {
        
    }
    
    
}

extension MealListPresenter: MealListInteractorOutput {
    
}
