//
//  MealListView.swift
//  RecipeRoamer
//
//  Created by Alphan Ogün on 26.01.2024.
//

import UIKit

protocol MealListViewDelegateOutput: AnyObject {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
}

class MealListView: UIView {
    
    //MARK: - Properties
    
    weak var output: MealListViewDelegateOutput?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 170, height: 180)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.register(MealCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search for recipes"
        searchBar.barStyle = .default
        searchBar.sizeToFit()
        return searchBar
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createSubviews()
        configureCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createSubviews() {
        backgroundColor = .white
        
        addSubview(searchBar)
        searchBar.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, right: rightAnchor)
        
        addSubview(collectionView)
        collectionView.anchor(top: searchBar.bottomAnchor, left: leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: rightAnchor,
                              paddingTop: 16, paddingLeft: 12, paddingRight: 12)
    }
    
    private func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

//MARK: - UICollectionViewDelegate/DataSource

extension MealListView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let output = output else { return 0 }
        return output.collectionView(collectionView, numberOfItemsInSection: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let output = output else { return UICollectionViewCell() }
        return output.collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let output = output else { return }
        return output.collectionView(collectionView, didSelectItemAt: indexPath)
    }
}
