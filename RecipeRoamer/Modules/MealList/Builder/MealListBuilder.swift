//
//  MealListBuilder.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 26.01.2024.
//

import UIKit

class MealListBuilder {
    
    func start() -> UINavigationController {
        let interactor = MealListInteractor()
        let view = MealListViewController()
        let router = MealListRouter()
        
        let navigationController = UINavigationController(rootViewController: view)
        router.navigationController = navigationController
        
        let presenter = MealListPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        return navigationController
    }
}
