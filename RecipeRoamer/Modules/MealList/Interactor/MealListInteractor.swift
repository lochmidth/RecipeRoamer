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
    
    //MARK: - Lifecycle
    
}

extension MealListInteractor: MealListInteractorInput {
    
}
