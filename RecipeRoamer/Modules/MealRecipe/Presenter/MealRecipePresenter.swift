//
//  MealRecipePresenter.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 27.01.2024.
//

import Foundation

protocol MealRecipeViewInput: AnyObject {
    
}

protocol MealRecipeInteractorInput: AnyObject {
    
}

class MealRecipePresenter {
    
    //MARK: - Properties
    
    weak var view: MealRecipeViewInput!
    var interactor: MealRecipeInteractorInput
    
    //MARK: - Lifecycle
    
    init(view: MealRecipeViewInput!, interactor: MealRecipeInteractorInput) {
        self.view = view
        self.interactor = interactor
    }
    
}

extension MealRecipePresenter: MealRecipeViewOutput {
    
}

extension MealRecipePresenter: MealRecipeInteractorOutput {
    
}
