//
//  MealListPresenter.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 26.01.2024.
//

import Foundation

protocol MealListViewInput: AnyObject {
    func configureNavigationBar()
    func configureKeyboardDismissal()
    func showLoading()
    func hideLoading()
    func reload(with meals: [MealProtocol])
    
}

protocol MealListInteractorInput: AnyObject {
    func fetchMeals(letter: String) async throws
    func searchMeal(query: String) async throws
}

protocol MealListRouterInput: AnyObject {
    
}

class MealListPresenter {
    
    weak var view: MealListViewInput!
    var interactor: MealListInteractorInput
    var router: MealListRouterInput
    var meals = [MealProtocol]()
    let fetchList = Array("abcdefghijklmnopqrstuvwxyz")
    var fetchIndex = 0
    
    init(view: MealListViewInput!, interactor: MealListInteractorInput, router: MealListRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    
}

extension MealListPresenter: MealListViewOutput {
    func viewDidLoad() {
        view.showLoading()
        view.configureNavigationBar()
        view.configureKeyboardDismissal()
        Task {
            try await interactor.fetchMeals(letter: String(fetchList[fetchIndex]))
            fetchIndex += 1
            try await interactor.fetchMeals(letter: String(fetchList[fetchIndex]))
        }
    }
    
    func didReachEndOfPage() {
        view.showLoading()
        Task {
            fetchIndex += 1
            if fetchIndex < fetchList.count {
                do {
                    try await interactor.fetchMeals(letter: String(fetchList[fetchIndex]))
                } catch {
                    print("Error while fetching meals, \(error.localizedDescription)")
                }
            }
        }
    }
    
    func didSelectItem(at index: Int) {
        
    }
    
    func queryTextDidChange(_ query: String) {
        
    }
    
    
}

extension MealListPresenter: MealListInteractorOutput {
    func interactor(_ interactor: MealListInteractorInput, didReceiveMeals meals: [MealProtocol]) {
        self.meals = meals
        Task { @MainActor in
            view.hideLoading()
            view.reload(with: meals)
        }
    }
    
    func interactor(_ interactor: MealListInteractorInput, didReceiveQueryResults items: [MealProtocol]) {
        
    }
    
    func interactor(_ interactor: MealListInteractorInput, didFailWith error: Error) {
        
    }
}
