//
//  MealRecipeViewController.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 27.01.2024.
//

import UIKit

protocol MealRecipeViewOutput: AnyObject {
    func viewDidLoad()
//    func configureCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
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

//MARK: - UITableViewDelegate/DataSource

extension MealRecipeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Constants.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath) as! MealRecipeTableViewCell
        cell.contentConfiguration = cell.configureCell(with: self.meal, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = MealRecipeHeaderView()
        header.configure(with: meal)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        Constants.heightForHeaderInSection
    }
}

//MARK: - MealRecipeViewInput

extension MealRecipeViewController: MealRecipeViewInput {
    func reload(with meal: Meal) {
        self.meal = meal
        mealRecipeView.tableView.reloadData()
    }
}

//MARK: - Constants

extension MealRecipeViewController {
    struct Constants {
        static let numberOfRows: Int = 3
        static let heightForHeaderInSection: CGFloat = 250
        static let reuseIdentifier = "MealRecipeCell"
    }
}
