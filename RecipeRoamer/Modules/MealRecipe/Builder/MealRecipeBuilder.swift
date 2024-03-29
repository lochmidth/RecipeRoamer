//
//  MealRecipeBuilder.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 27.01.2024.
//

import UIKit

final class MealRecipeBuilder {
    func build(with meal: Meal) -> UIViewController {
        let interactor = MealRecipeInteractor(meal: meal)
        let view = MealRecipeViewController()
        
        let presenter = MealRecipePresenter(view: view, interactor: interactor)
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
}
