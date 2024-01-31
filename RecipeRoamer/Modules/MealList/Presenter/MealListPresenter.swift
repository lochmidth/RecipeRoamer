//
//  MealListPresenter.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 26.01.2024.
//

import UIKit

protocol MealListViewInput: AnyObject {
    func configureNavigationBar()
    func configureKeyboardDismissal()
    func showLoading()
    func hideLoading()
    func reload(with meals: [Meal])
}

protocol MealListInteractorInput: AnyObject {
    func fetchMeals() async
    func searchMeal(query: String) async
}

protocol MealListRouterInput: AnyObject {
    func showRecipe(with meal: Meal)
    func showAlert(title: String, message: String)
}

final class MealListPresenter {
    
    weak var view: MealListViewInput!
    private var interactor: MealListInteractorInput
    private var router: MealListRouterInput
    private var meals = [Meal]()
    private var searchDispatchWorkItem: DispatchWorkItem?
    
    init(view: MealListViewInput!, interactor: MealListInteractorInput, router: MealListRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    private func search(_ query: String) {
        searchDispatchWorkItem?.cancel()
        setSearchDispatchWorkItem(with: query)
        
        guard let workItem = searchDispatchWorkItem else { return }
        Task {
            try await Task.sleep(nanoseconds: 600000000)
            workItem.perform()
        }
    }
    
    private func setSearchDispatchWorkItem(with text: String) {
        searchDispatchWorkItem = DispatchWorkItem { [weak self] in
            guard let self = self else { return }
            Task { @MainActor in
                self.view.showLoading()
                await self.interactor.searchMeal(query: text)
            }
        }
    }
    
    private func reload(with meals: [Meal]) {
        self.meals = meals
        Task { @MainActor in
            view.hideLoading()
            view.reload(with: meals)
        }
    }
}

extension MealListPresenter: MealListViewOutput {
    func viewDidLoad() {
        view.showLoading()
        view.configureNavigationBar()
        view.configureKeyboardDismissal()
        Task {
            await interactor.fetchMeals()
        }
    }
    
    func didReachEndOfPage(_ scrollView: UIScrollView) {
        let scrollThreshold = 0.4
        let scrolledHeight = scrollView.contentOffset.y + scrollView.frame.size.height
        let totalHeight = scrollView.contentSize.height
        let thresholdValue = totalHeight * scrollThreshold
        
        if scrolledHeight >= thresholdValue {
            Task {
                await interactor.fetchMeals()
            }
        }
    }
    
    func didSelectItem(at index: Int) {
        router.showRecipe(with: self.meals[index])
    }
    
    func queryTextDidChange(_ query: String) {
        search(query)
    }
    
    
}

extension MealListPresenter: MealListInteractorOutput {
    func interactor(_ interactor: MealListInteractorInput, didReceiveMeals meals: [Meal]) {
        reload(with: meals)
    }
    
    func interactor(_ interactor: MealListInteractorInput, didReceiveQueryResults meals: [Meal]) {
        reload(with: meals)
    }
    
    func interactor(_ interactor: MealListInteractorInput, didFailWith error: Error) {
        view.hideLoading()
        router.showAlert(title: "Oops!", message: error.localizedDescription)
    }
}
