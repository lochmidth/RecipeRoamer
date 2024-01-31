//
//  MealRecipeViewController.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 27.01.2024.
//

import UIKit

protocol MealRecipeViewOutput: AnyObject {
    func viewDidLoad()
    func configureCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
}

final class MealRecipeViewController: UIViewController {
    
    //MARK: - Properties
    
    var presenter: MealRecipeViewOutput!
    private let mealRecipeView = MealRecipeView()
    private var meal: Meal?
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    override func loadView() {
        mealRecipeView.tableView.delegate = self
        mealRecipeView.tableView.dataSource = self
        view = mealRecipeView
    }
}

extension MealRecipeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        presenter.configureCell(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = MealRecipeHeaderView()
        header.configure(with: meal)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        250
    }
}

extension MealRecipeViewController: MealRecipeViewInput {
    func reload(with meal: Meal) {
        self.meal = meal
        mealRecipeView.tableView.reloadData()
    }
}
