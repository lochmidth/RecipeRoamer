//
//  MealListView.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 26.01.2024.
//

import UIKit

final class MealListView: UIView {
    
    //MARK: - Properties
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 170, height: 180)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.register(MealCollectionViewCell.self, forCellWithReuseIdentifier: Constants.reuseIdentifier)
        return cv
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = Constants.searchBarPlacehodlerString
        searchBar.barStyle = .default
        searchBar.sizeToFit()
        searchBar.returnKeyType = .done
        return searchBar
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError(Constants.fatalError)
    }
    
    private func createSubviews() {
        backgroundColor = .white
        
        addSubview(searchBar)
        searchBar.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor)
        
        addSubview(collectionView)
        collectionView.anchor(top: searchBar.bottomAnchor, left: leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: rightAnchor,
                              paddingTop: 16, paddingLeft: 12, paddingRight: 12)
    }
}

extension MealListView {
    struct Constants {
        static let reuseIdentifier = "MealCollectionViewCell"
        static let searchBarPlacehodlerString = "Search for recipes"
        static let fatalError = "init(coder:) has not been implemented"
    }
}

