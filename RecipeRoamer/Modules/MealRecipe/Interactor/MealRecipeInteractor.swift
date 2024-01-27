//
//  MealRecipeInteractor.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 27.01.2024.
//

import Foundation

protocol MealRecipeInteractorOutput: AnyObject {
    
}

class MealRecipeInteractor {
    
    //MARK: - Properties
    
    weak var presenter: MealRecipeInteractorOutput!
}

extension MealRecipeInteractor: MealRecipeInteractorInput {
    
}
