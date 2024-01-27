//
//  MealRecipeView.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 27.01.2024.
//

import UIKit

class MealRecipeView: UIView {
    
    //MARK: - Properties
    
    let tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "mealCell")
        tv.backgroundColor = .clear
        tv.separatorStyle = .singleLine
        tv.separatorColor = .darkGray
        return tv
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func createSubviews() {
        addSubview(tableView)
        tableView.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: rightAnchor)
    }
}
