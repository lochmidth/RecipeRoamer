//
//  MealRecipeBuilder.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 27.01.2024.
//

import UIKit

class MealRecipeBuilder {
    func start() -> UIViewController {
        let interactor = MealRecipeInteractor()
        let view = MealRecipeViewController()
        
        let presenter = MealRecipePresenter(view: view, interactor: interactor)
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
}
