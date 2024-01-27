//
//  MealRecipeViewController.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 27.01.2024.
//

import UIKit

protocol MealRecipeViewOutput: AnyObject {
    
}

class MealRecipeViewController: UIViewController {
    
    //MARK: - Properties
    
    var presenter: MealRecipeViewOutput!
    
    let mealRecipeView = MealRecipeView()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealCell", for: indexPath)
        cell.textLabel?.text = "Meal"
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = MealRecipeHeaderView()
        header.configure()
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        250
    }
}

extension MealRecipeViewController: MealRecipeViewInput {
    
}

#Preview(traits: .defaultLayout, body: {
    UINavigationController(rootViewController: MealRecipeViewController())
})
