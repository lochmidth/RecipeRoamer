//
//  MealRecipeView.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 27.01.2024.
//

import UIKit

final class MealRecipeView: UIView {
    
    //MARK: - Properties
    
    let tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.register(MealRecipeTableViewCell.self, forCellReuseIdentifier: Constants.reuseIdentifier)
        tv.backgroundColor = .clear
        tv.separatorStyle = .singleLine
        tv.separatorColor = .darkGray
        tv.allowsSelection = false
        return tv
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError(Constants.fataError)
    }
    
    //MARK: - Helpers
    
    private func createSubviews() {
        backgroundColor = .white
        
        addSubview(tableView)
        tableView.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: rightAnchor)
    }
}

//MARK: - Constants

extension MealRecipeView {
    struct Constants {
        static let reuseIdentifier = "MealRecipeCell"
        static let fataError = "init(coder:) has not been implemented"
    }
}
