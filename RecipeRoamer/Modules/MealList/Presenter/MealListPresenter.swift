//
//  MealListPresenter.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 26.01.2024.
//

import Foundation

protocol MealListViewInput: AnyObject {
    
}

protocol MealListInteractorInput: AnyObject {
    
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
    
}

extension MealListPresenter: MealListViewOutput {
    func viewDidLoad() {
        
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
