//
//  MockMealListPresenter.swift
//  RecipeRoamerTests
//
//  Created by Alphan Ogün on 7.02.2024.
//

import UIKit
@testable import RecipeRoamer

class MockMealListPresenter: MealListViewOutput {
    
    weak var view: MealListViewInput!
    
    //MARK: - View Properties
    var viewLoaded = false
    var reachedEndOfPage = false
    var didSelectItem = false
    var selectedIndex: Int?
    var queryTextChanged = false
    var query = ""
    
    //MARK: - Interactor Properties
    
    var mealsReceived = false
    var queryResultsReceived = false
    var didNotReceiveAnyMealsCalled = false
    var meals = [Meal]()
    var failed = false
    var error: Error?
    
    //MARK: - View Output
    
    func viewDidLoad() {
        viewLoaded = true
    }
    
    func didReachEndOfPage(_ scrollView: UIScrollView) {
        reachedEndOfPage = true
    }
    
    func didSelectItem(at index: Int) {
        didSelectItem = true
        selectedIndex = index
    }
    
    func queryTextDidChange(_ query: String) {
        queryTextChanged = true
        self.query = query
    }
}

//MARK: - Interactor Output

extension MockMealListPresenter: MealListInteractorOutput {
    func interactor(_ interactor: RecipeRoamer.MealListInteractorInput, didReceiveMeals meals: [RecipeRoamer.Meal]) {
        mealsReceived = true
        self.meals = meals
    }
    
    func interactor(_ interactor: RecipeRoamer.MealListInteractorInput, didReceiveQueryResults meals: [RecipeRoamer.Meal]) {
        queryResultsReceived = true
        self.meals = meals
    }
    
    func interactor(_ interactor: RecipeRoamer.MealListInteractorInput, didFailWith error: Error) {
        failed = true
        self.error = error
    }
    
    func interactor(_ interactor: RecipeRoamer.MealListInteractorInput, didNotReceiveAnyMeals meals: [RecipeRoamer.Meal]) {
        didNotReceiveAnyMealsCalled = true
        self.meals = [Meal]()
    }
    
    
}
